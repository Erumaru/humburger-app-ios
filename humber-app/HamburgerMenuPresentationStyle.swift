//
//  HamburgerMenuPresentationStyle.swift
//  humber-app
//
//  Created by Abzal Toremuratuly on 9/5/20.
//  Copyright © 2020 Abzal Toremuratuly. All rights reserved.
//

import SideMenu

class HamburgerMenuPresentationStyle: SideMenuPresentationStyle {
    required init() {
        super.init()
        backgroundColor = .black
        menuOnTop = true
        onTopShadowColor = .black
        onTopShadowOpacity = 0.6
        onTopShadowRadius = 100
    }
}
