//
//  Helper+Player.swift
//  FightingGame
//
//  Created by Darrieumerlou on 10/08/2018.
//  Copyright © 2018 Darrieumerlou. All rights reserved.
//

import Foundation

struct Helper {
    /// Check if fighters in game for this two player are not dead
    static func isValidFighter(
        name: String,
        player1: Player,
        player2: Player) ->Bool {
        return player1.isValidFighter(name: name)
            && player2.isValidFighter(name: name)
    }
}
