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
}
