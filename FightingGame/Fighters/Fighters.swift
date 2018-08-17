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

enum Weapon: NSInteger, CustomStringConvertible {
    case sword = -30
    case axe = -40
    case stick = -20
    case power = 10
    
    var description: String {
        switch self {
        case .sword: return "Épée"
        case .axe: return "Hache"
        case .stick: return "Baton"
        case .power: return "Pouvoir"
        }
    }
    
    static var listing: [String] {
        return [
            "1. \(Weapon.sword.description)",
            "2. \(Weapon.axe.description)",
            "3. \(Weapon.stick.description)"
        ]
    }
}
