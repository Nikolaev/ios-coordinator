//
//  TitledViewController.swift
//  IOSCoordinator_Example
//
//  Created by Vitaly Nikolaev on 03.06.2021.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import RxCocoa

extension TitledViewController {
    
    struct Model {
        let title: String
        let description: String
        let actionTitle: String
    }
    
    struct Output {
        let action = PublishRelay<Void>()
    }
    
}

class TitledViewController: UIViewController {
    
    let output = Output()
    
    private let lblDescription = UILabel()
    private let btnAction = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure(with model: Model) {
        title = model.title
        lblDescription.text = model.description
        btnAction.setTitle(model.actionTitle, for: .normal)
    }
    
    private func configure() {
        navigationItem.backButtonTitle = ""
        
        view.backgroundColor = .white
        
        btnAction.translatesAutoresizingMaskIntoConstraints = false
        btnAction.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        
        lblDescription.translatesAutoresizingMaskIntoConstraints = false
        lblDescription.textAlignment = .center
        lblDescription.numberOfLines = 0
        
        view.addSubview(lblDescription)
        view.addSubview(btnAction)
        
        NSLayoutConstraint.activate(
            [btnAction.centerYAnchor.constraint(equalTo: view.centerYAnchor),
             btnAction.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             lblDescription.bottomAnchor.constraint(equalTo: btnAction.topAnchor, constant: -15),
             lblDescription.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
             lblDescription.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)]
        )
    }
    
    @objc private func tapAction() {
        output.action.accept(())
    }
    
}
