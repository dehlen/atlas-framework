//
//  GreenColorFactory.swift
//  AtlasDemo
//
//  Created by Engel, Stefan on 25.06.18.
//  Copyright © 2018 dm-drogerie markt GmbH + Co. KG. All rights reserved.
//

import Atlas

class GreenColorFactory: MVVMCTabBarFactoryProtocol {
    public var selectedTabBarIconImage = UIImage(named: "Heart")
    public var unselectedTabBarIconImage = UIImage(named: "Heart")

    public var transitionType: Atlas.MVVMCTransitionType = .push(animated: false)

    public func target(forIdentifier: MVVMCNavigationTarget) -> MVVMCFactoryProtocol? {
        return YellowColorFactory()
    }

    public func createView(model: MVVMCModelProtocol, delegate: MVVMCViewDelegate) -> UIViewController {
        let viewModel = GreenColorViewModel()
        viewModel.delegate = delegate
        let view = GreenColorViewController()
        view.viewModel = viewModel

        return view
    }
}
