import UIKit

class WhiteColorViewController: UIViewController {
    var viewModel: ColorViewModelProtocol?

    @IBAction func logout(_ sender: Any) {
        viewModel?.navigate(viewController: self)
    }
    
    override func viewDidLoad() {
        view.backgroundColor = viewModel?.backgroundColor
    }

    static func create() -> WhiteColorViewController {
        let viewController: WhiteColorViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WhiteColorViewController") as! WhiteColorViewController
        return viewController
    }
}
