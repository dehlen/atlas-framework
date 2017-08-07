import UIKit

public protocol MVVMCFactoryProtocol {
    var transitionType: MVVMCTransitionType { get }
    func target(forIdentifier: MVVMCNavigationTarget) -> MVVMCFactoryProtocol?
    func createView(model: MVVMCModelProtocol, delegate: MVVMCViewDelegate) -> UIViewController
}
