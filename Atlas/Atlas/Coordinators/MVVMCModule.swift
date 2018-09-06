//
//  MVVMCModule.swift
//  Atlas
//
//  Created by Engel, Stefan on 06.09.18.
//  Copyright © 2018 dm-drogerie markt GmbH + Co. KG. All rights reserved.
//

import UIKit

struct MVVMCModule {
    let factory: MVVMCTabBarFactoryProtocol
    let navigationController: UINavigationController
    let coordinator: MVVMCCoordinatorProtocol
}
