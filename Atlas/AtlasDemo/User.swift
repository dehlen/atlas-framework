import Atlas

class User {
    var loggedIn = false {
        didSet {
            notifyObservers()
        }
    }

    var observers: [MVVMCModelObserver] = []

    func login() {
        loggedIn = true
    }

    func logout() {
        loggedIn = false
    }
}

// MARK: - Helpers
extension User {
    func notifyObservers() {
        for observer in observers {
            observer.modelDidChange(model: self)
        }
    }
}

// MARK: - MVVMModelProtocol
extension User: MVVMCModelProtocol {
    public func register(observer: MVVMCModelObserver) {
        if !observers.contains(where: { $0 === observer }) {
            observers.append(observer)
        }
    }

    public func deregister(observer: MVVMCModelObserver) {
        observers = observers.filter { $0 !== observer }
    }
}
