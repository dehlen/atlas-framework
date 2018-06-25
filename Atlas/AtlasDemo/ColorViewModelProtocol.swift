import UIKit
import Atlas

protocol ColorViewModelProtocol {
    var backgroundColor: UIColor { get }
    var delegate: MVVMCViewDelegate? { get set }
    
    func navigate(viewController: UIViewController)
}
