//
//  Fight.swift
//  FightingGame
//
//  Created by Darrieumerlou on 09/08/2018.
//  Copyright © 2018 Darrieumerlou. All rights reserved.
//

import Foundation

class Fight {
    // ***********************************************
    // MARK: - Interface
    // ***********************************************
    private(set) var player1: Player
    private(set) var player2: Player
    // ***********************************************
    // MARK: - Implementation
    // ***********************************************
    public init(player1: Player, player2: Player) {
        self.player1 = player1
        self.player2 = player2
    }
    
    func start() {
        print("!! LE COMBAT VA COMMENCER !!")
        startChoosingFighter()
        startAttackOrCare()
    }
    // ***********************************************
    // MARK: - Private Methods
    // ***********************************************
    private func attackOrCare() ->String? {
        if let choice = readLine(), choice.isEmpty == false {
            return choice
        }
        return nil
    }
    
    private func chooseAttackOrCare() {
        switch attackOrCare() {
        case "1":
            print("Attaque")
        case "2":
            print("Soigne")
        default: print("Merci de saisir un choix valide")
        }
    }
    
    private func listingFighter(for player: Player) {
        print("\(player.firstname!): Sélectionner votre combattant:")
        player.fighters.enumerated().forEach { value in
            print("\(value.offset + 1). \(value.element.name)")
        }
    }
    
    private func chooseFighter(for player: Player) ->Fighter? {
        print("\nChoix:")
        if let choice = readLine(), choice.isEmpty == false {
            switch choice {
            case "1":
                return player.fighters.first!
            case "2":
                return player.fighters[1]
            case "3":
                return player.fighters.last!
            default: print("Sélection invalide. Saisisser un chiffre (ex: 1, 2, 3)")
            }
        }
        return nil
    }
}

extension Fight {
    func startChoosingFighter() {
        listingFighter(for: player1)
        var fighter: Fighter? = nil
        repeat {
            fighter = chooseFighter(for: player1)
        } while fighter == nil
        print("\(player1.firstname!): Combattant sélectionné est \(fighter!.name) de type \(fighter!.type.rawValue).")
    }
}

extension Fight {
    func startAttackOrCare() {
        print("Voulez-vous lancer une attaque ou soigner votre équipe?"
            + "\n1. Attaque"
            + "\n2. Soigner\n")
        chooseAttackOrCare()
    }
}
