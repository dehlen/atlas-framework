import UIKit

class NavigationControllerMock: UINavigationController {
    var didCallPresent = false
    var didCallPushViewController = false

    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        didCallPresent = true
        super.present(viewControllerToPresent, animated: flag, completion: completion)
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        didCallPushViewController = true
        super.pushViewController(viewController, animated: animated)
    }
}
