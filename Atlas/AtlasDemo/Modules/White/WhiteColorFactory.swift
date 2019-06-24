import Atlas

class WhiteColorFactory: MVVMCFactoryProtocol {
    public var transitionType: Atlas.MVVMCTransitionType = .push(animated: true)
    var container = UIViewController()
    var currentView: UIViewController?
    var model: MVVMCModelProtocol?
    var delegate: MVVMCViewDelegate?

    public func target(forIdentifier: MVVMCNavigationTarget) -> MVVMCFactoryProtocol? {
        return YellowColorFactory()
    }

    fileprivate func setupView(_ model: MVVMCModelProtocol, _ delegate: MVVMCViewDelegate) {
        if let user = model as? User, user.loggedIn == true {
            let viewModel = WhiteColorViewModel(model: model)
            viewModel.delegate = delegate
            let view = WhiteColorViewController.create()
            view.viewModel = viewModel
            
            container.addChild(view)
            container.view.addSubview(view.view)
            view.didMove(toParent: container)
        }
        else {
            let viewModel = BlackColorViewModel(model: model)
            viewModel.delegate = delegate
            let view = BlackColorViewController.create()
            view.viewModel = viewModel
            
            container.addChild(view)
            container.view.addSubview(view.view)
            view.didMove(toParent: container)
            currentView = view
        }
    }
    
    public func createView(model: MVVMCModelProtocol, delegate: MVVMCViewDelegate) -> UIViewController {
        self.model = model
        self.delegate = delegate
        
        setupView(model, delegate)
        return container
    }
    
    func update(withData data: [String : Any]?) {
        currentView?.willMove(toParent: nil)
        currentView?.removeFromParent()
        currentView?.view.removeFromSuperview()
        
        guard let model = model, let delegate = delegate else {
            return
        }

        setupView(model, delegate)
    }
}
