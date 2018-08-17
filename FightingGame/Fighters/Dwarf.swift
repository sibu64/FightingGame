//
//  Dwarf.swift
//  FightingGame
//
//  Created by Darrieumerlou on 04/08/2018.
//  Copyright © 2018 Darrieumerlou. All rights reserved.
//

import Foundation

class Dwarf: Fighter {
    // ***********************************************
    // MARK: - Interface
    // ***********************************************
    override var type: FighterType {
        get { return .dwarf }
        set {}
    }
    
    private var _weapon: Weapon = .axe
    override var weapon: Weapon {
        get { return _weapon }
        set {
            if newValue != .power {
                _weapon = newValue
            }
        }
    }
    
    private var _life: NSInteger = 30
    override var life: NSInteger {
        get { return _life }
        set { _life += newValue }
    }
}
