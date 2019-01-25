//
//  GreenColorFactory.swift
//  AtlasDemo
//
//  Created by Engel, Stefan on 25.06.18.
//  Copyright © 2018 dm-drogerie markt GmbH + Co. KG. All rights reserved.
//

import Atlas

class GreenColorFactory: MVVMCTabBarFactoryProtocol {
    var prefersLargeTitles = true

    public var selectedTabBarIconImage = UIImage(named: "Heart")
    public var unselectedTabBarIconImage = UIImage(named: "Heart")

    public var transitionType: Atlas.MVVMCTransitionType = .push(animated: false)

    public func target(forIdentifier: MVVMCNavigationTarget) -> MVVMCFactoryProtocol? {
        return WhiteColorFactory()
    }

    public func createView(model: MVVMCModelProtocol, delegate: MVVMCViewDelegate) -> UIViewController {
        let viewModel = GreenColorViewModel(model: model)
        viewModel.delegate = delegate
        let viewController = GreenColorViewController.create()
        viewController.viewModel = viewModel

        return viewController
    }
}
