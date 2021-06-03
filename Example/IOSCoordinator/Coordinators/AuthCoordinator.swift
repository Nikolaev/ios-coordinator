//
//  AuthCoordinator.swift
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

class AuthCoordinator: NavigationCoordinator {
    
    struct Output {
        let done = PublishRelay<Void>()
    }
    
    let output = Output()
    
    private let bag = DisposeBag()
    
    override func start() {
        presentStep1()
    }
    
    deinit { print("💀" + "\(type(of: self)) " + "dead") }
    
}

private extension AuthCoordinator {
    
    func presentStep1() {
        let vc = TitledViewController()
        vc.configure(with: .init(title: "Auth", description: "Step 1", actionTitle: "Next"))
        vc.output.action.subscribe(onNext: { [weak self] in
            self?.presentStep2()
        }).disposed(by: bag)
        set([vc])
    }
    
    func presentStep2() {
        let vc = TitledViewController()
        vc.configure(with: .init(title: "Auth", description: "Step 2", actionTitle: "Finish"))
        vc.output.action.bind(to: output.done).disposed(by: bag)
        push(vc)
    }
    
}
