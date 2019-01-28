import UIKit
import Atlas

class MVVMCFactoryMock: MVVMCFactoryProtocol {
    var transitionType: MVVMCTransitionType
    var createViewCallCount = 0

    init(transitionType: MVVMCTransitionType) {
        self.transitionType = transitionType
    }

    func target(forIdentifier: MVVMCNavigationTarget) -> MVVMCFactoryProtocol? {
        return nil
    }

    func createView(model: MVVMCModelProtocol, delegate: MVVMCViewDelegate) -> UIViewController {
        createViewCallCount += 1
        return UIViewController()
    }
}
