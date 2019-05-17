import Quick
import Nimble

@testable import Atlas

class MVVMCAppCoordinatorTests: QuickSpec {
    override func spec() {
        describe("The MVVMCAppCoordinator") {
            var sut: MVVMCAppCoordinator?
            var window: UIWindow?
            var rootViewController: UITabBarController?
            
            context("initialized with 2 factories") {
                context("calling start()") {
                    beforeEach {
                        window = UIWindow()
                        
                        sut = MVVMCAppCoordinator(model: ModelMock(), window: window!, factories: [Feature1Factory(), Feature2Factory()])
                        sut!.start()
                    }
                    
                    afterEach {
                        sut = nil
                        window = nil
                        rootViewController = nil
                    }
                    
                    context("on the first tab") {
                        var topMostViewController: UIViewController?
                        
                        beforeEach {
                            rootViewController = window!.rootViewController as? UITabBarController
                            topMostViewController = (rootViewController?.selectedViewController as! UINavigationController).topViewController
                        }
                        
                        afterEach {
                            rootViewController = nil
                            topMostViewController = nil
                        }
                        
                        it("has a navigationBar") {
                            expect(topMostViewController?.navigationController).notTo(beNil())
                        }
                        
                        it("has a tabBar") {
                            expect(topMostViewController?.tabBarController).notTo(beNil())
                        }
                        
                        it("has no title") {
                            expect(rootViewController?.tabBarItem.title).to(beNil())
                        }
                        
                        it("creates a tabBar with 2 elements") {
                            expect(rootViewController?.tabBar.items?.count).to(equal(2))
                        }
                        
                        it("sets the selected image for the first icon") {
                            expect(rootViewController?.tabBar.items?[0].selectedImage).to(equalImage(expectedValue: UIImage.loadTestImage(named: "CircleSelected")))
                        }
                        
                        it("sets the unselected image for the first icon") {
                            expect(rootViewController?.tabBar.items?[0].image).to(equalImage(expectedValue: UIImage.loadTestImage(named: "CircleUnselected")))
                        }
                        
                        it("starts the Feature1Coordinator") {
                            expect(topMostViewController).to(beAnInstanceOf(GreenTestViewController.self))
                        }
                    }
                    
                    context("tapping the already active first Tab") {
                        var navigationController: UINavigationController?

                        beforeEach {
                            sut!.tabBar.delegate?.tabBarController!((sut?.tabBar)!, didSelect: (sut?.modules[0].navigationController)!)
                            sut!.tabBar.selectedIndex = 0

                            navigationController = (window!.rootViewController as? UITabBarController)!.selectedViewController as? UINavigationController
                        }
                        
                        afterEach {
                            navigationController = nil
                        }

                        it("has one viewController on the navigation stack") {
                            expect(navigationController?.viewControllers.count).to(equal(1))
                        }
                    }
                    
                    context("switching to second Tab") {
                        beforeEach {
                            sut!.tabBar.delegate?.tabBarController!((sut?.tabBar)!, didSelect: (sut?.modules[1].navigationController)!)
                            sut!.tabBar.selectedIndex = 1
                            
                            rootViewController = window!.rootViewController as? UITabBarController
                        }
                        
                        afterEach {
                            rootViewController = nil
                        }
                        
                        it("starts a PushCoordinator") {
                            expect((rootViewController?.selectedViewController as! UINavigationController).topViewController).to(beAnInstanceOf(BlueTestViewController.self))
                        }
                        
                        it("has no title") {
                            expect(rootViewController?.tabBarItem.title).to(beNil())
                        }

                        it("keeps the other view") {
                            let viewController = sut?.modules[0].navigationController.topViewController
                            expect(viewController).notTo(beNil())
                        }
                        
                        context("switching to first tab") {
                            it("displays the MVVMCContainer") {
                                sut?.tabBar.delegate?.tabBarController!((sut?.tabBar)!, didSelect: (sut?.modules[0].navigationController)!)
                                sut?.tabBar.selectedIndex = 0
                                let viewController = sut?.modules[0].navigationController.topViewController
                                expect(viewController).to(beAnInstanceOf(GreenTestViewController.self))
                            }

                            it("keeps the other view") {
                                sut?.tabBar.delegate?.tabBarController!((sut?.tabBar)!, didSelect: (sut?.modules[0].navigationController)!)
                                sut?.tabBar.selectedIndex = 0
                                
                                let viewController = sut?.modules[1].navigationController.topViewController
                                expect(viewController).notTo(beNil())
                            }
                        }
                    }

                    // TODO: This test can be repaired as soon as coordinators are started lazily
                    xcontext("passing not a UINavigationViewController") {
                        beforeEach {
                            sut!.tabBar.delegate?.tabBarController!((sut?.tabBar)!, didSelect: UIViewController())
                            sut!.tabBar.selectedIndex = 1
                            
                            rootViewController = window!.rootViewController as? UITabBarController
                        }
                        
                        afterEach {
                            rootViewController = nil
                        }
                        
                        it("does not start the Coordinator") {
                            expect((rootViewController?.selectedViewController as! UINavigationController).topViewController).to(beNil())
                        }
                    }
                }
            }

            context("initialized with 2 factories") {
                context("calling start") {
                    context("calling start()") {
                        var didSetupFactory1: Bool = false
                        var didSetupFactory2: Bool = false

                        beforeEach {
                            window = UIWindow()

                            let feature1Factory = Feature1Factory()
                            feature1Factory.didSetupModule = {_, _, _ in
                                didSetupFactory1 = true
                            }
                            let feature2Factory = Feature2Factory()
                            feature2Factory.didSetupModule = {_, _, _ in
                                didSetupFactory2 = true
                            }
                            sut = MVVMCAppCoordinator(model: ModelMock(), window: window!, factories: [feature1Factory, feature2Factory])
                            sut!.start()

                            rootViewController = window!.rootViewController as? UITabBarController
                        }

                        afterEach {
                            sut = nil
                            rootViewController = nil
                        }

                        it("calls didSetupModule when a module is setup") {
                            expect(didSetupFactory1).to(beTrue())
                            expect(didSetupFactory2).to(beTrue())
                        }
                    }
                }
            }
            
            context("initialized with 3 factories") {
                context("calling start") {
                    context("calling start()") {
                        beforeEach {
                            window = UIWindow()
                            
                            sut = MVVMCAppCoordinator(model: ModelMock(), window: window!, factories: [Feature1Factory(), Feature2Factory(), Feature1Factory()])
                            sut!.start()
                            
                            rootViewController = window!.rootViewController as? UITabBarController
                        }
                        
                        afterEach {
                            sut = nil
                            rootViewController = nil
                        }
                        
                        it("creates a tabBar with 3 elements") {
                            expect((window!.rootViewController as! UITabBarController).tabBar.items?.count).to(equal(3))
                        }
                    }
                }
            }
        }
    }
}
