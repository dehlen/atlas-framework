import UIKit

protocol ContainerView {
    func addToContainer(view: Pinable)
    func clearContainer()
}

// MARK: - ContainerView implementation
extension UIView: ContainerView {
    func addToContainer(view: Pinable) {
        view.pinEdgesTo(superview: self)
    }
    
    func clearContainer() {
        self.subviews.forEach { $0.removeFromSuperview() }
    }
}
