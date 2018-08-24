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
    /// Name of fighter
    private(set) var name: String
    /// Life for fighter
    var life: NSInteger = 0
    /// Type of fighter
    var type: FighterType = .warrior
    /// Weapon of fighter
    var weapon: Weapon = .power
    // ***********************************************
    // MARK: - Implementation
    // ***********************************************
    /// Constructor - Instanciate a fighter with a name
    init(name: String) {
        self.name = name
    }
}
/// Enum Type of fighter
enum FighterType: String {
    case mage = "Mage"
    case warrior = "Guerrier"
    case dwarf = "Nain"
    case colossus = "Colosse"
}
/// Enum of damages weapons
enum Weapon: NSInteger, CustomStringConvertible {
    case sword = -30
    case axe = -40
    case stick = -20
    case power = 10
    
    /// Description in French for weapon
    var description: String {
        switch self {
        case .sword: return "Épée"
        case .axe: return "Hache"
        case .stick: return "Bâton"
        case .power: return "Pouvoir"
        }
    }

    /// Return valid weapon for a fighter who has to change weapon
    /// Not return his own weapon
    static func listing(for fighter: Fighter) ->[Weapon] {
        let initialWeapons = [Weapon.sword, Weapon.axe, Weapon.stick]
        let validWeapons = initialWeapons.filter { $0 != fighter.weapon }
        return validWeapons
    }
}
