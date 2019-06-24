import Atlas

class GreenColorViewModel: ColorViewModelProtocol {
    var backgroundColor: UIColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
    var delegate: MVVMCViewDelegate?
    var model: User

    init(model: MVVMCModelProtocol) {
        self.model = model as! User

        model.register(observer: self)
    }

    func navigate(viewController: UIViewController) {
        delegate?.request(navigation: MVVMCNavigationRequest.request(target: NavigationTargets.white), withData: nil)
    }
}
extension GreenColorViewModel: MVVMCModelObserver {
    func modelDidChange(model: MVVMCModelProtocol) {
        model.deregister(observer: self)
        delegate?.requestUpdate(withData: nil)
    }
}
