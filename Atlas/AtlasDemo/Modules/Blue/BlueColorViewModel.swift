import UIKit
import Atlas

class BlueColorViewModel: ColorViewModelProtocol {
    var backgroundColor: UIColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    var delegate: MVVMCViewDelegate?
    
    func navigate(viewController: UIViewController) {
        delegate?.request(navigation: MVVMCNavigationRequest.request(target: NavigationTargets.yellow), withData: nil)
    }
}
