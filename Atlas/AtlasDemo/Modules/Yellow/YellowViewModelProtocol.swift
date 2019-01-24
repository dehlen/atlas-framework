protocol YellowColorViewModelProtocol: ColorViewModelProtocol {
    var isLoggedIn: Bool { get }

    func dismiss()
    func login()
    func logout()
}
