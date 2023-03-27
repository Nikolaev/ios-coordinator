
//
//  MainCoordinator.swift
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


class MainCoordinator: TabBarCoordinator {
    
    struct Output {
        let logout = PublishRelay<Void>()
    }
    
    let output = Output()
    
    private let bag = DisposeBag()
    
    override func start() {
        configure()
    }
    
    deinit { print("💀" + "\(type(of: self)) " + "dead") }
    
}

private extension MainCoordinator {
    
    func configure() {
        let vcs = (0...3).map { index -> UIViewController in
            let vc = TitledViewController()
            vc.configure(with: .init(title: "Item \(index)", description: "Description \(index)", actionTitle: "LOGOUT"))
            vc.output.action.bind(to: output.logout).disposed(by: bag)
            return vc
        }
        set(vcs)
    }
    
}

