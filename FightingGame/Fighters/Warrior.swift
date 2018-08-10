//
//  Warrior.swift
//  FightingGame
//
//  Created by Darrieumerlou on 04/08/2018.
//  Copyright © 2018 Darrieumerlou. All rights reserved.
//

import Foundation

class Warrior: Fighter {
    // ***********************************************
    // MARK: - Interface
    // ***********************************************
    override var life: NSInteger {
        get { return 100 }
        set {}
    }
    override var type: FighterType {
        get { return .warrior }
        set {}
    }
    override var weapon: Weapon {
        get { return .sword }
        set {}
    }
}
