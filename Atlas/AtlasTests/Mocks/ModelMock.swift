import Atlas

class ModelMock: MVVMCModelProtocol {
    var isLoggedIn = false

    func register(observer: MVVMCModelObserver) {
    }

    func deregister(observer: MVVMCModelObserver) {
    }
}
