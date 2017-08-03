@testable import Atlas

class MVVMCCoordinatorMock: MVVMCCoordinatorProtocol {
    var coordinatorDelegate: MVVMCChildCoordinatorDelegate?
    var didCallCoordinatorRequestsDismissal = false
    var didCallViewModelRequestsWithData = false
    var didRequestDismissal = false
    
    func start() {
    }
    
    func startWithViewController() {
    }
    
    func viewModel(_ viewModel: MVVMCViewModelProtocol, requestsNavigation request: MVVMCNavigationRequest, withData data: [String : Any]?) {
        didCallViewModelRequestsWithData = true
        if request == .dismiss {
            didRequestDismissal = true
        }
    }
    
    func childCoordinatorRequestsDismissal(_ coordinator: MVVMCCoordinatorProtocol, transitionType: MVVMCTransitionType) {
        didCallCoordinatorRequestsDismissal = true
    }
}
