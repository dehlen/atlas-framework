import Atlas

class BlueColorFactory: MVVMCTabBarFactoryProtocol {
    public var selectedTabBarIconImage: UIImage?
    public var unselectedTabBarIconImage: UIImage?
    
    public var transitionType: Atlas.MVVMCTransitionType = .push(animated: true)

    public func target(forIdentifier: MVVMCNavigationTarget) -> MVVMCFactoryProtocol? {
        return YellowColorFactory()
    }
    
    public func createView(model: MVVMCModelProtocol, delegate: MVVMCViewDelegate) -> UIViewController {
        let viewModel = BlueColorViewModel()
        viewModel.delegate = delegate
        let view = ColorViewController()
        view.viewModel = viewModel
        
        return view
    }
}
