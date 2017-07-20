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
        var viewModel = factory.viewModel(model: model)
        viewModel.coordinatorDelegate = self
        
        display(viewModel: viewModel, withTransitionType: factory.transitionType)
   }
}

// MARK: - transitions
extension MVVMCCoordinator {
    func display(viewModel: MVVMCViewModelProtocol, withTransitionType transitionType: MVVMCTransitionType) {
        let container = MVVMCContainerView()
        container.model = model
        container.viewModel = viewModel as? MVVMCContainerViewModelProtocol
        
        switch transitionType {
            case .modal:
                navigationController.present(container, animated: true)
            case .push:
                navigationController.pushViewController(container, animated: false)
        }
    }
}

// MARK: - MVVMCViewModelDelegate
extension MVVMCCoordinator {
    func viewModel(_ viewModel: MVVMCViewModelProtocol, requestsNavigation request: MVVMCNavigationRequest, withData data: [String : Any]?) {
        switch request {
            case .dismiss: coordinatorDelegate?.childCoordinatorRequestsDismissal(self)
            case .request(let target): navigateTo(target)
        }
    }
    
    func navigateTo(_ target: MVVMCNavigationTarget) {
        guard let  targetFactory = factory.target(forIdentifier: target) else {
            return
        }
        
        targetCoordinator = MVVMCCoordinator(model: model, navigationController: navigationController, factory: targetFactory)
        targetCoordinator?.coordinatorDelegate = self
        targetCoordinator?.start()
    }
}

// MARK: - MVVMCChildCoordinatorDelegate
extension MVVMCCoordinator {
    func childCoordinatorRequestsDismissal(_ coordinator: MVVMCCoordinatorProtocol) {
        navigationController.dismiss(animated: true, completion: nil)
        targetCoordinator = nil
    }
}