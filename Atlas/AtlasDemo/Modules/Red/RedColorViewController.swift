import UIKit

class RedColorViewController: UIViewController {
    var viewModel: ColorViewModelProtocol?

    override func viewDidLoad() {
        view.backgroundColor = viewModel?.backgroundColor
    }

    @IBAction func navigate(_ sender: Any) {
        viewModel?.navigate(viewController: self)
    }

    static func create() -> RedColorViewController {
        let viewController: RedColorViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RedColorViewController") as! RedColorViewController
        return viewController
    }
}
