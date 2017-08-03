import UIKit

public protocol MVVMCFactoryProtocol {
    var transitionType: MVVMCTransitionType { get }
    func viewModel(model: MVVMCModelProtocol) -> MVVMCViewModelProtocol
    func target(forIdentifier: MVVMCNavigationTarget) -> MVVMCFactoryProtocol?
    func createView(model: MVVMCModelProtocol, delegate: MVVMCViewModelDelegate) -> UIViewController
}
