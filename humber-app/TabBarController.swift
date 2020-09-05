//
//  TabBarController.swift
//  humber-app
//
//  Created by Abzal Toremuratuly on 9/5/20.
//  Copyright © 2020 Abzal Toremuratuly. All rights reserved.
//

import UIKit
import SideMenu

class TabBarController: UITabBarController {
    
    lazy var firstVC: ViewController = {
        let vc = ViewController()
        vc.tabBarItem = .init(tabBarSystemItem: .favorites, tag: 0)
        
        return vc
    }()
    
    lazy var secondVC: ViewController = {
        let vc = ViewController()
        vc.tabBarItem = .init(tabBarSystemItem: .contacts, tag: 0)
        
        return vc
    }()
    
    init(color: UIColor = .red) {
        super.init(nibName: nil, bundle: nil)
        tabBar.tintColor = color
        modalPresentationCapturesStatusBarAppearance = true
        
        viewControllers = [
            NavigationController(rootViewController: firstVC),
            NavigationController(rootViewController: secondVC)
        ]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
