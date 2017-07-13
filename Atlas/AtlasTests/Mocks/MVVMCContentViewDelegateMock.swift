import Atlas

class MVVMCContentViewDelegateMock: MVVMCContentViewDelegate {
    var didCallContainerDidLoad = false
    var didCallContainerWillAppear = false
    var didCallContainerWillDisappear = false
    
    func containerDidLoad() {
        didCallContainerDidLoad = true
    }
    
    func containerWillAppear(_ animated: Bool) {
        didCallContainerWillAppear = true
    }
    
    func containerWillDisappear(_ animated: Bool) {
        didCallContainerWillDisappear = true
    }
}
