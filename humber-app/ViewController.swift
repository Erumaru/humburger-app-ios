//
//  ViewController.swift
//  humber-app
//
//  Created by Abzal Toremuratuly on 9/5/20.
//  Copyright © 2020 Abzal Toremuratuly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .purple
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.rightBarButtonItems = [
            .init(title: "Add", style: .plain, target: self, action: #selector(addVC)),
            .init(title: "Present", style: .plain, target: self, action: #selector(presentVC))
        ]
    }
    
    @objc private func addVC() {
        let vc = ViewController()
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func presentVC() {
        let vc = ViewController()
        present(vc, animated: true)
    }
}

