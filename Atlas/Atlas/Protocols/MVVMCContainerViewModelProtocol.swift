import UIKit

protocol MVVMCContainerViewModelProtocol: MVVMCViewModelProtocol {
    var view: UIView { get }
    var title: String { get }
}
