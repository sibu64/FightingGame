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
        print("•• 🌴 BIENVENUE SUR LE JEU FIGHTERS 🌴 ••")
        print("-----------------------------------------")
        print("- Vous allez personnaliser vos équipes.")
        print("- Merci de choisir le nom des deux joueurs.\n")
        player1.startNaming(position: 1)
        player1.startComposeFighter(with: player2)
        player2.startNaming(position: 2)
        player2.startComposeFighter(with: player1)
        
        fight = Fight(player1: player1, player2: player2)
        fight?.start()
    }
}
