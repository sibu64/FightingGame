//
//  Player.swift
//  FightingGame
//
//  Created by Darrieumerlou on 06/08/2018.
//  Copyright © 2018 Darrieumerlou. All rights reserved.
//

import Foundation

class Player {
    // ***********************************************
    // MARK: - Interface
    // ***********************************************
    var firstname: String? = nil
    var fighters = [Fighter]()
    // ***********************************************
    // MARK: - Implementation
    // ***********************************************
    init() { }
    
    func addFighter(_ fighter: Fighter) {
        fighters.append(fighter)
    }
    func isValidFighter(name: String) ->Bool {
        return !fighters.contains(where: { element -> Bool in
            return element.name == name
        })
    }
}
