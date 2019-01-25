import Atlas

class WhiteColorFactory: MVVMCFactoryProtocol {
    public var transitionType: Atlas.MVVMCTransitionType = .push(animated: true)

    public func target(forIdentifier: MVVMCNavigationTarget) -> MVVMCFactoryProtocol? {
        return YellowColorFactory()
    }

    public func createView(model: MVVMCModelProtocol, delegate: MVVMCViewDelegate) -> UIViewController {
        if let user = model as? User, user.loggedIn == true {
            let viewModel = WhiteColorViewModel(model: model)
            viewModel.delegate = delegate
            let view = WhiteColorViewController.create()
            view.viewModel = viewModel
            return view
        }
        else {
            let viewModel = BlackColorViewModel(model: model)
            viewModel.delegate = delegate
            let view = BlackColorViewController.create()
            view.viewModel = viewModel
            return view
        }
    }
}
