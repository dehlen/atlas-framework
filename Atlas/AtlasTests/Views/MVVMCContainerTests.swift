import Quick
import Nimble

@testable import Atlas

class MVVMCContainerTests: QuickSpec {
    override func spec() {
        describe("The MVVMCContainer") {
            context("with a red test view") {
                var model: ModelMock?
                var viewModel: MVVMCViewModelProtocol?
                var sut: MVVMCContainerView?
                
                beforeEach {
                    model = ModelMock()
                    viewModel = MVVMCTestContainerViewModel(model: model!)
                    (viewModel as! MVVMCTestContainerViewModel).testView = RedTestView()
                    sut = MVVMCContainerView()
                    sut!.model = model
                }
                
                afterEach {
                    viewModel = nil
                    sut = nil
                    model = nil
                }
                
                context("Adding two views") {
                    it("contains only one view") {
                        sut!.viewModel = viewModel as! MVVMCContainerViewModelProtocol?
                        
                        sut!.preloadView()
                        sut!.viewWillAppear(false)
                        
                        model = ModelMock()
                        let vm = MVVMCTestContainerViewModel(model: model!)
                        sut!.viewModel = vm
                        
                        expect(sut!.view.subviews.count).to(equal(1))
                    }
                }
                
                context("Calling viewWillApprear twice") {
                    it("contains only one view") {
                        sut!.viewModel = viewModel as! MVVMCContainerViewModelProtocol?
                        
                        sut!.preloadView()
                        sut!.viewWillAppear(false)
                        sut!.viewWillAppear(false)
                        
                        expect(sut!.view.subviews.count).to(equal(1))
                    }
                }
                
                context("after viewWillAppear") {
                    context("being in default state") {
                        it("will display the red test view") {
                            sut!.viewModel = viewModel as! MVVMCContainerViewModelProtocol?
                            sut!.preloadView()
                            sut!.viewWillAppear(false)
                            
                            expect(sut!.view.subviews[0]).to(beAnInstanceOf(RedTestView.self))
                        }
                    }
                }
                
                context("after Initialization") {
                    context("being default state") {
                        it("will display the red test view") {
                            sut!.preloadView()
                            
                            sut!.viewModel = viewModel as! MVVMCContainerViewModelProtocol?
                            
                            expect(sut!.view.subviews[0]).to(beAnInstanceOf(RedTestView.self))
                        }
                    }
                    
                    it("registers on model") {
                        expect(model?.observers.count).to(equal(1))
                    }
                }
                
                context("switching default state to notified state") {
                    it("switches to green test view") {
                        sut!.viewModel = viewModel as! MVVMCContainerViewModelProtocol?
                        
                        expect(sut!.view.subviews[0]).to(beAnInstanceOf(RedTestView.self))
                        (sut!.viewModel as! MVVMCTestContainerViewModel).testView = GreenTestView()

                        ((viewModel as! MVVMCTestContainerViewModel).model as! ModelMock).callObservers()
                        
                        expect(sut!.view.subviews[0]).to(beAnInstanceOf(GreenTestView.self))
                    }
                }
            }
            
            context("given no viewModel") {
                it("will not display a subview") {
                    let sut = MVVMCContainerView()
                    sut.preloadView()
                    sut.viewWillAppear(false)
                    
                    expect(sut.view.subviews.count).to(equal(0))
                }
            }
        }
        
        context("on the green test view") {
            var model: ModelMock?
            var viewModel: MVVMCViewModelProtocol?
            var sut: MVVMCContainerView?
            
            beforeEach {
                model = ModelMock()
                viewModel = MVVMCTestContainerViewModel(model: model!)
                (viewModel as! MVVMCTestContainerViewModel).testView = GreenTestView()
                sut = MVVMCContainerView()
                sut!.model = model
            }
            
            afterEach {
                viewModel = nil
                sut = nil
                model = nil
            }

            it("provides a contentViewDelegate") {
                sut!.preloadView()
                
                sut!.viewModel = viewModel as! MVVMCContainerViewModelProtocol?
                
                expect(sut!.viewDelegate).to(beAKindOf(MVVMCContentViewDelegate.self))
            }
            
            it("notifies the contentViewDelegate about viewWillAppear") {
                let mock = MVVMCContentViewDelegateMock()
                sut!.viewDelegate = mock
                
                sut!.viewWillAppear(false)
                
                expect(mock.didCallContainerWillAppear).to(beTrue())
            }

            it("notifies the contentViewDelegate about viewWillDisappear") {
                let mock = MVVMCContentViewDelegateMock()
                sut!.viewDelegate = mock
                
                sut!.viewWillDisappear(false)
                
                expect(mock.didCallContainerWillDisappear).to(beTrue())
            }

            it("notifies the contentViewDelegate about viewDidLoad") {
                let mock = MVVMCContentViewDelegateMock()
                sut!.viewDelegate = mock
                
                sut!.viewDidLoad()
                
                expect(mock.didCallContainerDidLoad).to(beTrue())
            }
        }
    }
}
