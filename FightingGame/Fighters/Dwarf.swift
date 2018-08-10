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
    override var weapon: Weapon {
        get { return .axe }
        set {}
    }
    override var life: NSInteger {
        get { return 30 }
        set {}
    }
}
