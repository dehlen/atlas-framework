import UIKit

public protocol MVVMCViewDelegate: class {
    func view(_ viewController: UIViewController, requestsNavigation request: MVVMCNavigationRequest, withData data: [String : Any]?)
    func requestsOverlayDismissal()
}
