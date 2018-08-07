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
    var type: FighterType {
        return .warrior
    }
    var name: String
    // ***********************************************
    // MARK: - Implementation
    // ***********************************************
    init(name: String) {
        self.name = name
    }
}
