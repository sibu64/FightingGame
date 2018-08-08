//
//  Fighters.swift
//  FightingGame
//
//  Created by Darrieumerlou on 04/08/2018.
//  Copyright © 2018 Darrieumerlou. All rights reserved.
//

import Foundation

protocol Fighter {
    var type: FighterType { get }
    var name: String { get set }
}

enum FighterType: String {
    case mage = "Mage"
    case warrior = "Combattant"
    case dwarf = "Nain"
    case colossus = "Colosse"
}

