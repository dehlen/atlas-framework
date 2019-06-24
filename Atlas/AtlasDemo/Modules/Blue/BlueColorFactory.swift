import Atlas

class BlueColorFactory: MVVMCTabBarFactoryProtocol {
    var didSetupModule: ((UINavigationController, UITabBarController, MVVMCViewDelegate) -> Void)?

    var prefersLargeTitles = true

    public var selectedTabBarIconImage = UIImage(named: "Home")
    public var unselectedTabBarIconImage = UIImage(named: "Home")
    
    public var transitionType: Atlas.MVVMCTransitionType = .push(animated: false)

    public func target(forIdentifier: MVVMCNavigationTarget) -> MVVMCFactoryProtocol? {
        return YellowColorFactory()
    }
    
    public func createView(model: MVVMCModelProtocol, delegate: MVVMCViewDelegate) -> UIViewController {
        // TODO: Use Container, see WhiteColorFactory
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
