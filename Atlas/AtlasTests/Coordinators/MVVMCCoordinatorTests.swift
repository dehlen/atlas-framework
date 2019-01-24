import Quick
import Nimble

@testable import Atlas

class MVVMCCoordinatorTests: QuickSpec {
    override func spec() {
        describe("The MVVMCCoordinator") {
            context("after calling start()") {
                context("being in default state") {
                    var model: ModelMock?
                    var sut: MVVMCCoordinator?
                    var navigation: UINavigationController?

                    beforeEach {
                        let factory = StateFactory()
                        navigation = UINavigationController()
                        model = ModelMock()
                        sut = MVVMCCoordinator(model: model!, navigationController: navigation!, factory: factory)
                    }

                    afterEach {
                        sut = nil
                        model = nil
                        navigation = nil
                    }

                    it("displays the red test view") {
                        sut!.start()
                        
                        expect(navigation!.topViewController).to(beAnInstanceOf(RedTestViewController.self))
                    }

                    context("when the logged in state changes") {
                        beforeEach {
                            model!.isLoggedIn = true
                        }

                        context("calling reload()") {
                            beforeEach {
                                sut!.reload()
                            }

                            it("shows the new view") {
                                expect(navigation!.topViewController).to(beAnInstanceOf(BlueTestViewController.self))
                            }
                        }
                    }
                }
            }

            context("with stateFactory") {
                context("after calling start()") {
                    var sut: MVVMCCoordinator?
                    var navController: UINavigationController?
                    let factory = StateFactory()
                    
                    beforeEach {
                        navController = UINavigationController()
                        
                        let model = ModelMock()
                        
                        sut = MVVMCCoordinator(model: model, navigationController: navController!, factory: factory)
                        sut?.start()
                    }
                    
                    afterEach {
                        sut = nil
                        navController = nil
                    }
                    
                    context("requesting dismissal") {
                        it("request its coordinatorDelegate to dismiss") {
                            let mock = MVVMCCoordinatorMock()
                            sut!.coordinatorDelegate = mock
                            sut!.request(navigation: MVVMCNavigationRequest.dismiss, withData: nil)
                            expect(mock.didCallCoordinatorRequestsDismissal).to(beTrue())
                        }
                    }
                }
            }
            
            context("with stateFactory") {
                context("after calling start()") {                    
                    context("calling viewModel requestTransition") {
                        it("displays the green test view") {
                            let model = ModelMock()
                            let factory = StateFactory()
                            
                            let navigation = UINavigationController()
                            
                            let sut = MVVMCCoordinator(model: model, navigationController: navigation, factory: factory)
                            
                            sut.start()
                            
                            sut.request(navigation: MVVMCNavigationRequest.request(target: TestTargets.green), withData: nil)
                            
                            expect(navigation.topViewController).to(beAnInstanceOf(GreenTestViewController.self))
                        }

                        //commented out due to Window requesting client id
                        xit("displays the blue test view") {
                            let model = ModelMock()
                            let factory = BlueFactory()
                            
                            let navigation = UINavigationController()
                            
                            let sut = MVVMCCoordinator(model: model, navigationController: navigation, factory: factory)
                            
                            let window = UIWindow(frame: UIScreen.main.bounds)
                            window.makeKey()
                            window.rootViewController = navigation

                            sut.start()
                            
                            sut.request(navigation: MVVMCNavigationRequest.request(target: TestTargets.blue), withData: nil)
                            
                            expect(navigation.presentedViewController).to(beAnInstanceOf(BlueTestViewController.self))
                        }

                        it("sets itself as coordinatorDelegate") {
                            let model = ModelMock()
                            let factory = StateFactory()
                            
                            let navigation = UINavigationController()
                            
                            let sut = MVVMCCoordinator(model: model, navigationController: navigation, factory: factory)
                            
                            sut.start()
                            
                            sut.request(navigation: MVVMCNavigationRequest.request(target: TestTargets.green), withData: nil)
                            
                            expect(sut.targetCoordinator?.coordinatorDelegate).to(be(sut))
                        }
                        
                        it("dismisses the green test view") {
                            let model = ModelMock()
                            let factory = StateFactory()
                            
                            let navigation = UINavigationController()

                            let sut = MVVMCCoordinator(model: model, navigationController: navigation, factory: factory)
                            
                            sut.start()
                            
                            sut.request(navigation: MVVMCNavigationRequest.request(target: TestTargets.green), withData: nil)
                            
                            sut.childCoordinatorRequestsDismissal(sut.targetCoordinator!, transitionType: factory.transitionType, animated: false)
                            
                            expect(navigation.presentedViewController).toEventually(beNil(), timeout: 2)
                            expect(navigation.topViewController).toEventually(beAnInstanceOf(RedTestViewController.self))
                        }
                    }
                }
            }
        }
    }
}
