@testable import Atlas

class MVVMCTestContainerViewModel: MVVMCContainerViewModelProtocol {
    var view: UIView {
        return testView ?? UIView()
    }
    
    var title = ""
    
    var coordinatorDelegate: MVVMCViewModelDelegate?
    var testView: UIView?
    var model: MVVMCModelProtocol
    
    required init(model: MVVMCModelProtocol) {
        self.model = model
    }
}
