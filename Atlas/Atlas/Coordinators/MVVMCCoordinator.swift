import UIKit

class MVVMCCoordinator {
    var model: MVVMCModelProtocol
    var factory: MVVMCFactoryProtocol
    var navigationController: UINavigationController
    var targetCoordinator: MVVMCCoordinatorProtocol?
    weak var coordinatorDelegate: MVVMCChildCoordinatorDelegate?
    var overlayViewContainer: UIViewController?

    required init(model: MVVMCModelProtocol, navigationController: UINavigationController, factory: MVVMCFactoryProtocol) {
        self.model = model
        self.navigationController = navigationController
        self.factory = factory
    }
}

// MARK: - CoordinatorProtocol
extension MVVMCCoordinator: MVVMCCoordinatorProtocol {
    func start() {
        let view = factory.createView(model: model, delegate: self)
        display(view: view, withTransitionType: factory.transitionType)
    }
}

// MARK: - transitions
extension MVVMCCoordinator {
    func display(view: UIViewController, withTransitionType transitionType: MVVMCTransitionType) {
        switch transitionType {
            case .modal(let animated):
                navigationController.present(view, animated: animated)
            case .push(let animated):
                navigationController.pushViewController(view, animated: animated)
            case .overlay: ()
        }
    }
}

// MARK: - Handling of overlays
extension MVVMCCoordinator {
    fileprivate func presentAsOverlay(_ view: UIViewController) {
        if overlayViewContainer != nil { return }
        guard let topViewController = navigationController.topViewController else { return }
        view.view.isUserInteractionEnabled = false
        topViewController.addChildViewController(view)
        topViewController.view.addSubview(view.view)
        view.view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            view.view.topAnchor.constraint(equalTo: topViewController.view.bottomAnchor),
            view.view.leftAnchor.constraint(equalTo: topViewController.view.leftAnchor),
            view.view.widthAnchor.constraint(equalTo: topViewController.view.widthAnchor)
        ])

        view.didMove(toParentViewController: navigationController)
        overlayViewContainer = view
    }

    fileprivate func removeOverlay() {
        guard let overlayViewContainer = overlayViewContainer else {
            return
        }

        overlayViewContainer.willMove(toParentViewController: nil)
        overlayViewContainer.view.removeFromSuperview()
        overlayViewContainer.removeFromParentViewController()

        self.overlayViewContainer = nil
    }

    func requestsOverlayDismissal() {
        removeOverlay()
    }
}

// MARK: - MVVMCViewModelDelegate
extension MVVMCCoordinator {
    func view(_ viewController: UIViewController, requestsNavigation request: MVVMCNavigationRequest, withData data: [String : Any]?) {
        switch request {
        case .dismiss: coordinatorDelegate?.childCoordinatorRequestsDismissal(self, transitionType: factory.transitionType, animated: true)
        case .request(let target): navigateTo(target)
        case .overlay: presentAsOverlay(viewController)
        }
    }
    
    func navigateTo(_ target: MVVMCNavigationTarget) {
        guard let targetFactory = factory.target(forIdentifier: target) else {
            return
        }

        targetCoordinator = MVVMCCoordinator(model: model, navigationController: navigationController, factory: targetFactory)
        targetCoordinator?.coordinatorDelegate = self
        targetCoordinator?.start()
    }
}

// MARK: - MVVMCChildCoordinatorDelegate
extension MVVMCCoordinator {
    func childCoordinatorRequestsDismissal(_ coordinator: MVVMCCoordinatorProtocol, transitionType: MVVMCTransitionType, animated: Bool) {
        switch transitionType {
            case .push: navigationController.popViewController(animated: animated)
            case .modal: navigationController.dismiss(animated: animated, completion: nil)
            case .overlay: ()
        }
        targetCoordinator = nil
    }
}
