@testable import Atlas

class ModelMock: MVVMCModelProtocol {
    var observers: [MVVMCModelObserver] = []

    func register(observer: MVVMCModelObserver) {
        observers.append(observer)
    }
    
    func deregister(observer: MVVMCModelObserver) {
    }
    
    func callObservers() {
        for observer in observers {
            observer.modelDidChange(model: self)
        }
    }
}
