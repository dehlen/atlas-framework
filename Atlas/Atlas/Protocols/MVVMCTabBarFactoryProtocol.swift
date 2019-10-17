import UIKit

public protocol MVVMCTabBarFactoryProtocol: MVVMCFactoryProtocol {
    var tabBarItemTitle: String? { get }
    var selectedTabBarIconImage: UIImage? { get }
    var unselectedTabBarIconImage: UIImage? { get }
    var prefersLargeTitles: Bool { get }
    var didSetupModule: ((UINavigationController, UITabBarController, MVVMCViewDelegate) -> Void)? { get }
}
