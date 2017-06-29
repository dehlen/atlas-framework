import UIKit

protocol MVVMCViewModelProtocol {
    var coordinatorDelegate: MVVMCViewModelDelegate? { get set }
    
    init(model: MVVMCModelProtocol)
}
