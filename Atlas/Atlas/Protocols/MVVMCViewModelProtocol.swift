import UIKit

public protocol MVVMCViewModelProtocol {
    var coordinatorDelegate: MVVMCViewModelDelegate? { get set }
    
    init(model: MVVMCModelProtocol)
}
