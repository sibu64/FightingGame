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
    /// Override life for fighter
    private var _life: NSInteger = 50//100
    override var life: NSInteger {
        get { return _life }
        set { _life += newValue }
    }
    
    /// Override a type of fighter
    override var type: FighterType {
        get { return .warrior }
        set {}
    }
    
    /// Override a type of weapon
    private var _weapon: Weapon = .sword
    override var weapon: Weapon {
        get { return _weapon }
        set {
            if newValue != .power {
                _weapon = newValue
            }
        }
    }
}
