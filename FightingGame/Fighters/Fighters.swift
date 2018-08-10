//
//  Fighters.swift
//  FightingGame
//
//  Created by Darrieumerlou on 04/08/2018.
//  Copyright © 2018 Darrieumerlou. All rights reserved.
//

import Foundation

class Fighter {
    // ***********************************************
    // MARK: - Interface
    // ***********************************************
    private(set) var name: String
    var life: NSInteger = 0
    var type: FighterType = .warrior
    var weapon: Weapon = .power
    // ***********************************************
    // MARK: - Implementation
    // ***********************************************
    init(name: String) {
        self.name = name
    }
}

enum FighterType: String {
    case mage = "Mage"
    case warrior = "Combattant"
    case dwarf = "Nain"
    case colossus = "Colosse"
}

enum Weapon: NSInteger {
    case sword = -10
    case axe = -20
    case stick = -2
    case power = 10
}
