//
//  HumberMenuNavigationController.swift
//  humber-app
//
//  Created by Abzal Toremuratuly on 9/5/20.
//  Copyright © 2020 Abzal Toremuratuly. All rights reserved.
//

import SideMenu

class HumburgerMenuNavigationController: SideMenuNavigationController {
    static var shared = HumburgerMenuNavigationController(rootViewController: HumburgerMenuViewController())
    var maskView: UIView?
    
    override init(rootViewController: UIViewController, settings: SideMenuSettings = SideMenuSettings()) {
        super.init(rootViewController: rootViewController, settings: settings)
        
        presentationStyle = .menuSlideIn
        menuWidth = UIScreen.main.bounds.width * 0.8
        leftSide = true
        sideMenuDelegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HumburgerMenuNavigationController: SideMenuNavigationControllerDelegate {
    func sideMenuWillAppear(menu: SideMenuNavigationController, animated: Bool) {
        guard let topView = presentingViewController?.view else { return }
        let view = UIView()
        view.backgroundColor = .red
        view.alpha = 0
        view.frame = topView.bounds
        maskView = view
        topView.addSubview(view)
        UIView.animate(withDuration: 0.3) {
            view.alpha = 0.5
        }
    }
    
    func sideMenuWillDisappear(menu: SideMenuNavigationController, animated: Bool) {
        UIView.animate(withDuration: 0.3, animations: {
            self.maskView?.alpha = 0
        }) { _ in
            self.maskView?.removeFromSuperview()
            self.maskView = nil
        }
    }
}
