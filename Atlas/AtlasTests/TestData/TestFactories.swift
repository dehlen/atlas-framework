import Atlas

class StateFactory: MVVMCFactoryProtocol {
    var transitionType = MVVMCTransitionType.push
    
    func viewModel(model: MVVMCModelProtocol) -> MVVMCViewModelProtocol {
        let testViewModel = MVVMCTestContainerViewModel(model: model)
        testViewModel.testView = RedTestView()
        return testViewModel
    }
    
    func target(forIdentifier: MVVMCNavigationTarget) -> MVVMCFactoryProtocol? {
        return GreenFactory()
    }

    func createView(model: MVVMCModelProtocol, delegate: MVVMCViewModelDelegate) -> UIViewController {
        return RedTestViewController()
    }
}

class GreenFactory: MVVMCFactoryProtocol {
    var transitionType = MVVMCTransitionType.push
    
    func viewModel(model: MVVMCModelProtocol) -> MVVMCViewModelProtocol {
        let testViewModel = MVVMCTestContainerViewModel(model: model)
        testViewModel.testView = GreenTestView()
        return testViewModel
    }
    
    func target(forIdentifier: MVVMCNavigationTarget) -> MVVMCFactoryProtocol? {
        return BlueFactory()
    }

    func createView(model: MVVMCModelProtocol, delegate: MVVMCViewModelDelegate) -> UIViewController {
        let vc = GreenTestViewController()
        vc.delegate = delegate
        return vc
    }
}

class BlueFactory: MVVMCFactoryProtocol {
    var transitionType = MVVMCTransitionType.modal
    
    func viewModel(model: MVVMCModelProtocol) -> MVVMCViewModelProtocol {
        let testViewModel = MVVMCTestContainerViewModel(model: model)
        testViewModel.testView = BlueTestView()
        return testViewModel
    }
    
    func target(forIdentifier: MVVMCNavigationTarget) -> MVVMCFactoryProtocol? {
        return nil
    }

    func createView(model: MVVMCModelProtocol, delegate: MVVMCViewModelDelegate) -> UIViewController {
        return UIViewController()
    }
}

class Feature1Factory: MVVMCTabBarFactoryProtocol {
    var selectedTabBarIconImage = UIImage.loadTestImage(named: "CircleSelected")
    var unselectedTabBarIconImage = UIImage.loadTestImage(named: "CircleUnselected")
    
    var transitionType = MVVMCTransitionType.push
    
    func viewModel(model: MVVMCModelProtocol) -> MVVMCViewModelProtocol {
        let testViewModel = MVVMCTestContainerViewModel(model: model)
        testViewModel.testView = GreenTestView()
        return testViewModel
    }
    
    func target(forIdentifier: MVVMCNavigationTarget) -> MVVMCFactoryProtocol? {
        return nil
    }

    func createView(model: MVVMCModelProtocol, delegate: MVVMCViewModelDelegate) -> UIViewController {
        return UIViewController()
    }
}

class Feature2Factory: MVVMCTabBarFactoryProtocol {
    var selectedTabBarIconImage = UIImage.loadTestImage(named: "DiamondSelected")
    var unselectedTabBarIconImage = UIImage.loadTestImage(named: "DiamondUnselected")
    
    var transitionType = MVVMCTransitionType.push
    
    func viewModel(model: MVVMCModelProtocol) -> MVVMCViewModelProtocol {
        let testViewModel = MVVMCTestContainerViewModel(model: model)
        testViewModel.testView = BlueTestView()
        return testViewModel
    }
    
    func target(forIdentifier: MVVMCNavigationTarget) -> MVVMCFactoryProtocol? {
        return nil
    }

    func createView(model: MVVMCModelProtocol, delegate: MVVMCViewModelDelegate) -> UIViewController {
        return UIViewController()
    }
}
