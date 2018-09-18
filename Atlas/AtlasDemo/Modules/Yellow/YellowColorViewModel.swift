import Atlas

class YellowColorViewModel: ColorViewModelProtocol {
    var backgroundColor: UIColor = #colorLiteral(red: 0.9686274529, green: 0.9036289322, blue: 0.3450980484, alpha: 1)
    var delegate: MVVMCViewDelegate?
    
    func navigate(viewController: UIViewController) {
        delegate?.request(navigation: MVVMCNavigationRequest.request(target: NavigationTargets.yellow), withData: nil)
    }
}
