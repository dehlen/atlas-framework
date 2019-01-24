import Atlas

class BlueColorFactory: MVVMCTabBarFactoryProtocol {
    var prefersLargeTitles = true

    public var selectedTabBarIconImage = UIImage(named: "Home")
    public var unselectedTabBarIconImage = UIImage(named: "Home")
    
    public var transitionType: Atlas.MVVMCTransitionType = .push(animated: false)

    public func target(forIdentifier: MVVMCNavigationTarget) -> MVVMCFactoryProtocol? {
        return YellowColorFactory()
    }
    
    public func createView(model: MVVMCModelProtocol, delegate: MVVMCViewDelegate) -> UIViewController {
        if let user = model as? User, user.loggedIn == true {
            let viewModel = RedColorViewModel(model: model)
            viewModel.delegate = delegate
            let view = RedColorViewController.create()
            view.viewModel = viewModel
            return view
        }
        else {
            let viewModel = BlueColorViewModel(model: model)
            viewModel.delegate = delegate
            let view = BlueColorViewController.create()
            view.viewModel = viewModel
            return view
        }
    }
}
