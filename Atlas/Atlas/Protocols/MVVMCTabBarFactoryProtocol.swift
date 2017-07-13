import UIKit

protocol MVVMCTabBarFactoryProtocol: MVVMCFactoryProtocol {
    var selectedTabBarIconImage: UIImage? { get }
    var unselectedTabBarIconImage: UIImage? { get }
}
