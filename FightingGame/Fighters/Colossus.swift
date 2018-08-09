//
//  Colossus.swift
//  FightingGame
//
//  Created by Darrieumerlou on 04/08/2018.
//  Copyright © 2018 Darrieumerlou. All rights reserved.
//

import Foundation


class Colossus: Fighter {
    // ***********************************************
    // MARK: - Interface
    // ***********************************************
    var name: String
    var life: NSInteger = 90
    var type: FighterType {
        return .colossus
    }
    var weapon: Weapon {
        return .stick
    }
    // ***********************************************
    // MARK: - Implementation
    // ***********************************************
    init(name: String) {
        self.name = name
    }
}
