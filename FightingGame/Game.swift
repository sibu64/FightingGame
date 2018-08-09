//
//  Game.swift
//  FightingGame
//
//  Created by Darrieumerlou on 07/08/2018.
//  Copyright © 2018 Darrieumerlou. All rights reserved.
//

import Foundation

class Game {
    // ***********************************************
    // MARK: - Interface
    // ***********************************************
    private let team = Team()
    private var fight: Fight? = nil
    // ***********************************************
    // MARK: - Implementation
    // ***********************************************
    func play() {
        //team.start()
        let player1 = Player()
        player1.firstname = "Steve"
        player1.fighters = [
            Warrior(name: "David"),
            Mage(name: "Dandal"),
            Dwarf(name: "Dupont")
        ]
        
        let player2 = Player()
        player2.firstname = "Simon"
        player2.fighters = [
            Warrior(name: "Joseph"),
            Colossus(name: "William"),
            Dwarf(name: "Helene")
        ]
        
        //fight = Fight(player1: team.player1, player2: team.player2)
        fight = Fight(player1: player1, player2: player2)
        fight?.start()
    }
}
