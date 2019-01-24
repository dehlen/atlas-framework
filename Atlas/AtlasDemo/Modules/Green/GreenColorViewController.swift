import UIKit

class GreenColorViewController: UIViewController {
    var viewModel: ColorViewModelProtocol?

    override func viewDidLoad() {
        view.backgroundColor = viewModel?.backgroundColor
    }
}
