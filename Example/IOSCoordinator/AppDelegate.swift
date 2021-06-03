//
//  AppDelegate.swift
//  IOSCoordinator
//
//  Created by Nikolaev on 05/11/2021.
//  Copyright (c) 2021 Nikolaev. All rights reserved.
//

import UIKit
import IOSCoordinator

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var coordinator: AppWindowCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        coordinator = AppWindowCoordinator(container: window!)
        coordinator.start()
        return true
    }

}

