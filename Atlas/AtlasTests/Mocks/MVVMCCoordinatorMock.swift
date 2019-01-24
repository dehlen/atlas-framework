import UIKit
@testable import Atlas

class MVVMCCoordinatorMock: MVVMCCoordinatorProtocol {
    var coordinatorDelegate: MVVMCChildCoordinatorDelegate?
    var didCallCoordinatorRequestsDismissal = false
    var didCallViewModelRequestsWithData = false
    var didRequestDismissal = false
    
    func start() {
    }

    func reload() {
    }

    func startWithViewController() {
    }
    
    func request(navigation request: MVVMCNavigationRequest, withData data: [String : Any]?) {
        didCallViewModelRequestsWithData = true
        if request == .dismiss {
            didRequestDismissal = true
        }
    }
    
    func childCoordinatorRequestsDismissal(_ coordinator: MVVMCCoordinatorProtocol, transitionType: MVVMCTransitionType, animated: Bool) {
        didCallCoordinatorRequestsDismissal = true
    }
}
