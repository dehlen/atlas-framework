//
//  AppDelegate.swift
//  AtlasDemo
//
//  Created by Engel, Stefan on 25.06.18.
//  Copyright © 2018 dm-drogerie markt GmbH + Co. KG. All rights reserved.
//

import UIKit
import Atlas

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: MVVMCAppCoordinator!


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()

        let model = EmptyModel()
        appCoordinator = MVVMCAppCoordinator(model: model, window: window!, factories: [BlueColorFactory(), GreenColorFactory()])
        appCoordinator.start()

        return true
    }
}

extension AppDelegate: MVVMCViewDelegate {
    func request(navigation request: MVVMCNavigationRequest, withData data: [String : Any]?) {
    }
}
