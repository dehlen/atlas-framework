import UIKit

public class MVVMCAppCoordinator: NSObject {
    let model: MVVMCModelProtocol
    let window: UIWindow
    let factories: [MVVMCTabBarFactoryProtocol]
    let tabBar: UITabBarController
    var navigationControllers: [UINavigationController] = []
    var coordinatorStack: [UINavigationController: MVVMCCoordinatorProtocol] = [:]
    
    required public init(model: MVVMCModelProtocol, window: UIWindow, factories: [MVVMCTabBarFactoryProtocol]) {
        self.model = model
        self.window = window
        self.factories = factories
        
        tabBar = UITabBarController()
        
        super.init()
        
        tabBar.delegate = self
        setupTabBar()
        
        window.rootViewController = tabBar
    }
    
    public func start() {
        startTab(viewController: navigationControllers[0])
    }
    
    func setupTabBar() {
        for factory in factories {
            let navController = setupTabBarItem(image: factory.unselectedTabBarIconImage, selectedImage: factory.selectedTabBarIconImage)
            navigationControllers.append(navController)
        }
        
        tabBar.viewControllers = navigationControllers
    }
    
    func setupTabBarItem(image: UIImage?, selectedImage: UIImage?) -> UINavigationController {
        let navController = UINavigationController()
        navController.tabBarItem = UITabBarItem(title: nil, image: image, selectedImage: selectedImage)
        navController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        return navController
    }
    
    func startTab(viewController: UINavigationController) {
        var controllers: [UINavigationController] = []
        for (index, controller) in navigationControllers.enumerated() {
            if controller === viewController {
                controller.viewControllers = []
                controllers.append(controller)
                let factory = factories[index]
                let coordinator = MVVMCCoordinator(model: model, navigationController: viewController, factory: factory)
                coordinatorStack[controller] = coordinator
                coordinator.start()
            }
            else {
                coordinatorStack[controller] = nil
                let factory = factories[index]
                let navController = setupTabBarItem(image: factory.unselectedTabBarIconImage, selectedImage: factory.selectedTabBarIconImage)
                controllers.append(navController)
            }
        }
        
        navigationControllers = controllers
        tabBar.viewControllers = navigationControllers
    }
}

// MARK: - UITabBarControllerDelegate
extension MVVMCAppCoordinator: UITabBarControllerDelegate {
    public func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let viewController = viewController as? UINavigationController else {
            return
        }
        
        startTab(viewController: viewController)
    }
}
