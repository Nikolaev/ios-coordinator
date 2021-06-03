//
//  AppWindowCoordinator.swift
//  IOSCoordinator_Example
//
//  Created by Vitaly Nikolaev on 03.06.2021.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import IOSCoordinator

class AppWindowCoordinator: WindowCoordinator {
    
    override func start() {
        configure()
    }
    
    private func configure() {
        presentApp()
    }
    
    private func presentApp() {
        let container = UINavigationController()
        let coord = AppCoordinator(container: container)
        setRoot(viewControler: container)
        coord.start()
    }
    
    deinit { print("💀" + "\(type(of: self)) " + "dead") }
    
}
