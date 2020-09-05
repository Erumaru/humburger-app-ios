//
//  NavigationController.swift
//  humber-app
//
//  Created by Abzal Toremuratuly on 9/5/20.
//  Copyright © 2020 Abzal Toremuratuly. All rights reserved.
//

import UIKit
import SideMenu

class NavigationController: UINavigationController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateMenuVisibility()
    }
    
    override func popViewController(animated: Bool) -> UIViewController? {
        let vc = super.popViewController(animated: animated)
        updateMenuVisibility()
        return vc
    }
    
    private func updateMenuVisibility() {
        print("fire")
        if viewControllers.count == 1, let vc = viewControllers.first {
            vc.navigationItem.leftBarButtonItem = .init(title: "Menu", style: .plain, target: self, action: #selector(openMenu))
        } else {
            print(viewControllers.count)
        }
    }
    
    @objc private func openMenu() {
        present(HumburgerMenuNavigationController.shared, animated: true)
    }
}

