//
//  HumburgerMenuNavigationController.swift
//  humber-app
//
//  Created by Abzal Toremuratuly on 9/5/20.
//  Copyright © 2020 Abzal Toremuratuly. All rights reserved.
//

import UIKit
import SnapKit
import SideMenu

class HumburgerMenuViewController: UIViewController {
    lazy var redButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        button.setTitleColor(.red, for: .normal)
        button.setTitle("RED", for: .normal)
        button.addTarget(self, action: #selector(changeRoot(_:)), for: .touchUpInside)
        button.tag = 0
        
        return button
    }()
    
    lazy var greenButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        button.setTitleColor(.green, for: .normal)
        button.setTitle("GREEN", for: .normal)
        button.addTarget(self, action: #selector(changeRoot(_:)), for: .touchUpInside)
        button.tag = 1
        
        return button
    }()
    
    lazy var firstVC: TabBarController = {
        let vc = TabBarController(color: .red)
        return vc
    }()
    
    lazy var secondVC: TabBarController = {
        let vc = TabBarController(color: .green)
        return vc
    }()
    
    public lazy var viewControllers: [UIViewController] = [
        self.firstVC, self.secondVC
    ]
    
    @objc private func changeRoot(_ button: UIButton) {
        print("change to vc: \(button.tag)")
        self.dismiss(animated: true) { [weak self] in
            guard let self = self else { return }
            UIApplication.shared.windows.first { $0.isKeyWindow }?.rootViewController = self.viewControllers[button.tag]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        markup()
    }
    
    private func markup() {
        view.backgroundColor = .blue
        
        [redButton, greenButton].forEach { view.addSubview($0) }
        
        redButton.snp.makeConstraints {
            $0.top.equalTo(view.snp.topMargin)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(48)
        }
        
        greenButton.snp.makeConstraints {
            $0.top.equalTo(redButton.snp.bottom)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(48)
        }
    }
}
