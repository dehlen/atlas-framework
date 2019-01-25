import UIKit

class GreenColorViewController: UIViewController {
    var viewModel: ColorViewModelProtocol?

    @IBAction func push(_ sender: Any) {
        viewModel?.navigate(viewController: self)
    }
    override func viewDidLoad() {
        view.backgroundColor = viewModel?.backgroundColor
    }

    static func create() -> GreenColorViewController {
        let viewController: GreenColorViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GreenColorViewController") as! GreenColorViewController
        return viewController
    }
}
