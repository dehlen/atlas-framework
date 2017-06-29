import UIKit

class MVVMCContainerView: UIViewController {
    var viewModel: MVVMCContainerViewModelProtocol? {
        didSet {
            addViewToContainer()
            
            if let view = viewModel?.view {
                addViewDelegate(view: view)
            }
        }
    }
    
    var model: MVVMCModelProtocol? {
        didSet {
            model?.register(observer: self)
        }
    }
    
    weak var viewDelegate: MVVMCContentViewDelegate?
}

// MARK: - Lifecycle Events
extension MVVMCContainerView {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        addViewToContainer()
        viewDelegate?.containerWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        viewDelegate?.containerWillDisappear(animated)
    }
    
    override func viewDidLoad() {
        viewDelegate?.containerDidLoad()
    }
}

// MARK: - UserObserver
extension MVVMCContainerView: MVVMCModelObserver {
    func modelDidChange(model: MVVMCModelProtocol) {
        addViewToContainer()
    }
}

// MARK: - Helper
extension MVVMCContainerView {
    func addViewToContainer() {
        guard let subview = viewModel?.view else {
            return
        }
        
        navigationItem.title = viewModel?.title
        view.clearContainer()
        view.addToContainer(view: subview)
    }
    
    func addViewDelegate(view: UIView) {
        guard let view = view as? MVVMCContentViewDelegate else {
            return
        }
        
        viewDelegate = view
    }
}
