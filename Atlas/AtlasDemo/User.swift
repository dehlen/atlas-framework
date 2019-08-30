import Atlas

class User {
    var loggedIn = false {
        didSet {
            notifyObservers()
        }
    }

    var observers: [UserObserverProtocol] = []

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
            observer.didUpdateUser(self)
        }
    }

    public func register(observer: UserObserverProtocol) {
        if !observers.contains(where: { $0 === observer }) {
            observers.append(observer)
        }
    }

    public func deregister(observer: UserObserverProtocol) {
        observers = observers.filter { $0 !== observer }
    }
}

extension User: MVVMCModelProtocol {}
