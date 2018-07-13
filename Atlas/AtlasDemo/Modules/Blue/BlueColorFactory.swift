import Atlas

class BlueColorFactory: MVVMCTabBarFactoryProtocol {
    public var selectedTabBarIconImage = UIImage(named: "Home")
    public var unselectedTabBarIconImage = UIImage(named: "Home")
    
    public var transitionType: Atlas.MVVMCTransitionType = .push(animated: false)

    public func target(forIdentifier: MVVMCNavigationTarget) -> MVVMCFactoryProtocol? {
        return YellowColorFactory()
    }
    
    public func createView(model: MVVMCModelProtocol, delegate: MVVMCViewDelegate) -> UIViewController {
        let viewModel = BlueColorViewModel()
        viewModel.delegate = delegate
        let view = BlueColorViewController.create()
        view.viewModel = viewModel
        
        return view
    }
}
