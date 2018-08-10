//
//  Mage.swift
//  FightingGame
//
//  Created by Darrieumerlou on 04/08/2018.
//  Copyright © 2018 Darrieumerlou. All rights reserved.
//

import Foundation

class Mage: Fighter {
    // ***********************************************
    // MARK: - Interface
    // ***********************************************
    override var type: FighterType {
        get { return .mage }
        set {}
    }
    override var weapon: Weapon {
        get { return .power }
        set {}
    }
    override var life: NSInteger {
        get { return 80 }
        set {}
    }
}
