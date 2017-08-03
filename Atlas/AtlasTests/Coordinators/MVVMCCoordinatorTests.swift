import Quick
import Nimble

@testable import Atlas

class MVVMCCoordinatorTests: QuickSpec {
    override func spec() {
        describe("The MVVMCCoordinator") {
            context("after calling start()") {
                context("being in default state") {
                    it("displays the red test view") {
                        let model = ModelMock()
                        let factory = StateFactory()
                        let navigation = UINavigationController()
                        let sut = MVVMCCoordinator(model: model, navigationController: navigation, factory: factory)
                        
                        sut.start()
                        
                        expect(navigation.topViewController?.view.subviews[0]).to(beAnInstanceOf(RedTestView.self))
                    }
                }
            }

            context("after calling start()") {
                context("being in default state") {
                    it("displays the red test view") {
                        let model = ModelMock()
                        let factory = StateFactory()
                        let navigation = UINavigationController()
                        let sut = MVVMCCoordinator(model: model, navigationController: navigation, factory: factory)
                        
                        sut.startWithViewController()
                        
                        expect(navigation.topViewController).to(beAnInstanceOf(RedTestViewController.self))
                    }
                }
            }

            context("with login view") {
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
                            sut!.viewModel(factory.viewModel(model: ModelMock()), requestsNavigation: MVVMCNavigationRequest.dismiss, withData: nil)
                            expect(mock.didCallCoordinatorRequestsDismissal).to(beTrue())
                        }
                    }
                }
            }
            
            context("with productsView") {
                context("after calling start()") {                    
                    context("calling viewModel requestTransition") {
                        it("displays the green test view") {
                            let model = ModelMock()
                            let factory = StateFactory()
                            
                            let navigation = UINavigationController()
                            
                            let sut = MVVMCCoordinator(model: model, navigationController: navigation, factory: factory)
                            
                            sut.startWithViewController()
                            
                            sut.viewModel(MVVMCTestContainerViewModel(model: model), requestsNavigation: MVVMCNavigationRequest.request(target: TestTargets.green), withData: nil)
                            
                            expect(navigation.topViewController).to(beAnInstanceOf(GreenTestViewController.self))
                        }

                        xit("displays the blue test view") {
                            let model = ModelMock()
                            let factory = BlueFactory()
                            
                            let navigation = UINavigationController()
                            
                            let sut = MVVMCCoordinator(model: model, navigationController: navigation, factory: factory)
                            
                            let window = UIWindow(frame: UIScreen.main.bounds)
                            window.makeKey()
                            window.rootViewController = navigation

                            sut.start()
                            
                            sut.viewModel(MVVMCTestContainerViewModel(model: model), requestsNavigation: MVVMCNavigationRequest.request(target: TestTargets.blue), withData: nil)
                            
                            expect(navigation.presentedViewController?.view?.subviews.first).to(beAnInstanceOf(BlueTestView.self))
                        }

                        it("sets itself as coordinatorDelegate") {
                            let model = ModelMock()
                            let factory = StateFactory()
                            
                            let navigation = UINavigationController()
                            
                            let sut = MVVMCCoordinator(model: model, navigationController: navigation, factory: factory)
                            
                            sut.start()
                            
                            sut.viewModel(MVVMCTestContainerViewModel(model: model), requestsNavigation: MVVMCNavigationRequest.request(target: TestTargets.green), withData: nil)
                            
                            expect(sut.targetCoordinator?.coordinatorDelegate).to(be(sut))
                        }
                        
                        xit("dismisses the green test view") {
                            let model = ModelMock()
                            let factory = StateFactory()
                            
                            let navigation = UINavigationController()

                            let sut = MVVMCCoordinator(model: model, navigationController: navigation, factory: factory)
                            
                            sut.startWithViewController()
                            
                            sut.viewModel(MVVMCTestContainerViewModel(model: model), requestsNavigation: MVVMCNavigationRequest.request(target: TestTargets.green), withData: nil)
                            
                            sut.childCoordinatorRequestsDismissal(sut.targetCoordinator!, transitionType: factory.transitionType)
                            
                            expect(navigation.presentedViewController).toEventually(beNil(), timeout: 2)
                            expect(navigation.topViewController).toEventually(beAnInstanceOf(RedTestViewController.self), timeout: 10) // do we need a window???
                        }
                    }
                }
            }
        }
    }
}
