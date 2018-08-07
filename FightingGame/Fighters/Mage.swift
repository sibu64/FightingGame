//
//  Mage.swift
//  FightingGame
//
//  Created by Darrieumerlou on 04/08/2018.
//  Copyright © 2018 Darrieumerlou. All rights reserved.
//

import Foundation

class Mage: Fighter {
    // ***********************************************
    // MARK: - Interface
    // ***********************************************
    var type: FighterType {
        return .mage
    }
    var name: String
    // ***********************************************
    // MARK: - Implementation
    // ***********************************************
    init(name: String) {
        self.name = name
    }
}
