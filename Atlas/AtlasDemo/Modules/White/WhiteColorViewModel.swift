import UIKit
import Atlas

class WhiteColorViewModel: ColorViewModelProtocol {
    var backgroundColor: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    var delegate: MVVMCViewDelegate?
    var model: User

    init(model: MVVMCModelProtocol) {
        self.model = model as! User
        self.model.register(observer: self)
    }

    func navigate(viewController: UIViewController) {
        delegate?.request(navigation: MVVMCNavigationRequest.request(target: NavigationTargets.yellow), withData: nil)
    }
}

// MARK: - MVVMCModelObserver
extension WhiteColorViewModel: UserObserverProtocol {
    func didUpdateUser(_ user: User) {
        model.deregister(observer: self)
        delegate?.requestUpdate(withData: nil)
    }
}
