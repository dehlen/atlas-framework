import UIKit

public class MVVMCAppCoordinator: NSObject {
    let model: MVVMCModelProtocol
    let window: UIWindow
    let tabBar: UITabBarController
    var modules: [MVVMCModule]
    
    required public init(model: MVVMCModelProtocol, window: UIWindow, factories: [MVVMCTabBarFactoryProtocol]) {
        self.model = model
        self.window = window
        self.modules = []
        
        tabBar = UITabBarController()
        tabBar.viewControllers = []
        
        super.init()
        
        tabBar.delegate = self
        setupModules(for: factories)

        window.rootViewController = tabBar
    }
    
    public func start() {
        // TODO: Do not start all modules directly at the beginning
        for module in modules {
            module.coordinator.start()
        }
    }

    func setupModules(for factories: [MVVMCTabBarFactoryProtocol]) {
        var rootViewControllers: [UINavigationController] = []

        for factory in factories {
            let navigationController = setupTabBarItem(image: factory.unselectedTabBarIconImage, selectedImage: factory.selectedTabBarIconImage, prefersLargeTitles: factory.prefersLargeTitles)
            let coordinator = MVVMCCoordinator(model: model, navigationController: navigationController, factory: factory)
            let module = MVVMCModule(factory: factory, navigationController: navigationController, coordinator: coordinator)

            rootViewControllers.append(navigationController)
            modules.append(module)
        }

        tabBar.setViewControllers(rootViewControllers, animated: false)
        tabBar.tabBar.isTranslucent = false
    }

    func setupTabBarItem(image: UIImage?, selectedImage: UIImage?, prefersLargeTitles: Bool = true) -> UINavigationController {
        let navController = UINavigationController()
        navController.navigationBar.isTranslucent = false
        if #available(iOS 11.0, *) {
            navController.navigationBar.prefersLargeTitles = prefersLargeTitles
        }
        navController.tabBarItem = UITabBarItem(title: nil, image: image, selectedImage: selectedImage)
        navController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)

        navController.view.backgroundColor = UIColor.white
        return navController
    }
}

// MARK: - UITabBarControllerDelegate
extension MVVMCAppCoordinator: UITabBarControllerDelegate {
    public func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//        guard let viewController = viewController as? UINavigationController else {
//            return
//        }
        
//        startTab(viewController: viewController)
    }
}
