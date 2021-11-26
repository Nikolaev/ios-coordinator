//
//  AppCoordinator.swift
//  IOSCoordinator_Example
//
//  Created by Vitaly Nikolaev on 03.06.2021.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import IOSCoordinator

class AppCoordinator: NavigationCoordinator {
    
    private let bag = DisposeBag()
    
    override func start() {
        presentAuth()
    }
    
    deinit { print("💀" + "\(type(of: self)) " + "dead") }
    
}

private extension AppCoordinator {
    
    func presentAuth() {
        let coord = AuthCoordinator(container: container)
        coord.output.done
            .subscribe(onNext: { [weak coord, weak self] in
                self?.removeChild(coordinator: coord)
                self?.presentMain()
            }).disposed(by: bag)
        coord.start()
    }
    
    func presentMain() {
        let coord = MainCoordinator(container: UITabBarController())
        coord.output.logout.subscribe(onNext: { [weak coord, weak self] in
            self?.removeChild(coordinator: coord)
            self?.presentAuth()
        }).disposed(by: bag)
        set([coord.container])
        coord.start()
    }
    
}
