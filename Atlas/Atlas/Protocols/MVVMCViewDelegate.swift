import UIKit

public protocol MVVMCViewDelegate: class {
    func request(navigation request: MVVMCNavigationRequest, withData data: [String: Any]?)
    func reload()
}
