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
        appCoordinator = MVVMCAppCoordinator(model: model, window: window!, factories: [BlueColorFactory()])
        appCoordinator.start()

        return true
    }
}

class DelegateMock: MVVMCViewDelegate {
    func view(_ viewController: UIViewController, requestsNavigation request: MVVMCNavigationRequest, withData data: [String : Any]?) {
        print("============ Navigation request")
    }
}

extension AppDelegate: MVVMCViewDelegate {
    public func view(_ viewController: UIViewController, requestsNavigation request: Atlas.MVVMCNavigationRequest, withData data: [String : Any]?) {
    }
}
