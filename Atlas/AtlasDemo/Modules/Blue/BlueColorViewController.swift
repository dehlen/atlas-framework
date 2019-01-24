import UIKit

class BlueColorViewController: UIViewController {
    var viewModel: ColorViewModelProtocol?

    override func viewDidLoad() {
        view.backgroundColor = viewModel?.backgroundColor
    }

    @IBAction func navigateButtonPressed(_ sender: Any) {
        viewModel?.navigate(viewController: self)
    }

    static func create() -> BlueColorViewController {
        let viewController: BlueColorViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BlueColorViewController") as! BlueColorViewController
        return viewController
    }
}
