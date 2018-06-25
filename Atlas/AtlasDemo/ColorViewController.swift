import UIKit

class ColorViewController: UIViewController {
    var viewModel: ColorViewModelProtocol?

    deinit {
        print("====== deinit")
    }

    override var nibName: String? {
        return "ColorViewController"
    }
    
    @IBAction func navigate(_ sender: Any) {
        viewModel?.navigate(viewController: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        view.backgroundColor = viewModel?.backgroundColor
        view.backgroundColor = UIColor.red
    }
}
