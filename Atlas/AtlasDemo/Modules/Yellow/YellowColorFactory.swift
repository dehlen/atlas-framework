import Atlas

class YellowColorFactory: MVVMCFactoryProtocol {
    public var transitionType: Atlas.MVVMCTransitionType = .modal(animated: true)
    
    public func target(forIdentifier: MVVMCNavigationTarget) -> MVVMCFactoryProtocol? {
        return nil
    }
    
    public func createView(model: MVVMCModelProtocol, delegate: MVVMCViewDelegate) -> UIViewController {
        let viewModel = YellowColorViewModel(model: model)
        viewModel.delegate = delegate
        let viewController = YellowColorViewController.create()
        viewController.viewModel = viewModel
        
        return viewController
    }
}
