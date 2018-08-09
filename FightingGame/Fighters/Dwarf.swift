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
    var name: String
    var life: NSInteger = 30
    var type: FighterType {
        return .dwarf
    }
    var weapon: Weapon {
        return .axe
    }
    // ***********************************************
    // MARK: - Implementation
    // ***********************************************
    init(name: String) {
        self.name = name
    }
}
