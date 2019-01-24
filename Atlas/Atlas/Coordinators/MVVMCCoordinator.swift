import UIKit

class MVVMCCoordinator {
    var model: MVVMCModelProtocol
    var factory: MVVMCFactoryProtocol
    var navigationController: UINavigationController
    var targetCoordinator: MVVMCCoordinatorProtocol?
    weak var coordinatorDelegate: MVVMCChildCoordinatorDelegate?

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

    func reload() {
        dismissCurrentView(factory.transitionType)
        start()
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
        }
    }
}

// MARK: - MVVMCViewModelDelegate
extension MVVMCCoordinator {
    func request(navigation request: MVVMCNavigationRequest, withData data: [String : Any]?) {
        switch request {
            case .dismiss: coordinatorDelegate?.childCoordinatorRequestsDismissal(self, transitionType: factory.transitionType, animated: true)
            case .request(let target): navigateTo(target)
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
        dismissCurrentView(transitionType)
        targetCoordinator = nil
    }
}

// MARK: - Handling the view controllers
extension MVVMCCoordinator {
    private func dismissCurrentView(_ transitionType: MVVMCTransitionType) {
        switch transitionType {
            case .push(let animated): navigationController.popViewController(animated: animated)
            case .modal(let animated): navigationController.dismiss(animated: animated, completion: nil)
        }
    }
}
