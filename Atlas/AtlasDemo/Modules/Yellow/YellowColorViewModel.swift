import Atlas

class YellowColorViewModel: YellowColorViewModelProtocol {
    let user: User

    var backgroundColor: UIColor = #colorLiteral(red: 0.9686274529, green: 0.9036289322, blue: 0.3450980484, alpha: 1)
    var delegate: MVVMCViewDelegate?

    var isLoggedIn: Bool {
        return user.loggedIn
    }

    init(model: MVVMCModelProtocol) {
        user = model as! User
    }
    
    func navigate(viewController: UIViewController) {
        delegate?.request(navigation: MVVMCNavigationRequest.request(target: NavigationTargets.yellow), withData: nil)
    }

    func dismiss() {
        delegate?.request(navigation: .dismiss, withData: nil)
    }

    func login() {
        user.login()
        dismiss()
    }

    func logout() {
        user.logout()
        dismiss()
    }
}
