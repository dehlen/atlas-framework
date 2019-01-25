import UIKit

class BlackColorViewController: UIViewController {
    var viewModel: ColorViewModelProtocol?

    @IBAction func login(_ sender: Any) {
        viewModel?.navigate(viewController: self)
    }

    override func viewDidLoad() {
        view.backgroundColor = viewModel?.backgroundColor
    }

    static func create() -> BlackColorViewController {
        let viewController: BlackColorViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BlackColorViewController") as! BlackColorViewController
        return viewController
    }
}
