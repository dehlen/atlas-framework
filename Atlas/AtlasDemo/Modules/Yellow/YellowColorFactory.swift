import Atlas

class YellowColorFactory: MVVMCFactoryProtocol {
    public var transitionType: Atlas.MVVMCTransitionType = .push(animated: true)
    
    public func target(forIdentifier: MVVMCNavigationTarget) -> MVVMCFactoryProtocol? {
        return nil
    }
    
    public func createView(model: MVVMCModelProtocol, delegate: MVVMCViewDelegate) -> UIViewController {
        let viewModel = YellowColorViewModel()
        viewModel.delegate = delegate
        let viewController = YellowColorViewController()
        viewController.viewModel = viewModel
        
        return viewController
    }
}
