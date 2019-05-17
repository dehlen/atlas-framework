import UIKit

public protocol MVVMCTabBarFactoryProtocol: MVVMCFactoryProtocol {
    var selectedTabBarIconImage: UIImage? { get }
    var unselectedTabBarIconImage: UIImage? { get }
    var prefersLargeTitles: Bool { get }
    var didSetupModule: ((UINavigationController, UITabBarController, MVVMCViewDelegate) -> Void)? { get }
}
