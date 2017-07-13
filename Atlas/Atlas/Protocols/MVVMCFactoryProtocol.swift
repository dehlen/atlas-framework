import UIKit

protocol MVVMCFactoryProtocol {
    var transitionType: MVVMCTransitionType { get }
    func viewModel(model: MVVMCModelProtocol) -> MVVMCViewModelProtocol
    func target(forIdentifier: MVVMCNavigationTarget) -> MVVMCFactoryProtocol?
}
