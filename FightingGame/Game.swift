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
    private var fight: Fight? = nil
    private var player1 = Player()
    private var player2 = Player()
    // ***********************************************
    // MARK: - Implementation
    // ***********************************************
    func play() {
        /*print("Bonjour, bienvenue sur le jeux Fighters.")
         print("Vous allez personnaliser vos équipes.")
         print("Merci de choisir le nom des deux joueurs.")
         player1.startNaming(position: 1)
         player1.startComposeFighter(with: player2)
         player2.startNaming(position: 2)
         player2.startComposeFighter(with: player1)*/
        
        let player1 = Player()
        player1.firstname = "Simon"
        player1.fighters = [
            Warrior(name: "David"),
            Mage(name: "Dandal"),
            Dwarf(name: "Dupont")
        ]
        
        let player2 = Player()
        player2.firstname = "Steve"
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
