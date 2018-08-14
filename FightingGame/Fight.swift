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
        print("•• !! LE COMBAT VA COMMENCER !! ••")
        print("----------------------------------\n")
        repeat {
            let fighterPlayer1 = startChoosingFighter(for: player1)
            startAction(for: player1, attack: player2, with: fighterPlayer1)
            guard gameOver() == false else { break }
            let fighterPlayer2 = startChoosingFighter(for: player2)
            startAction(for: player2, attack: player1, with: fighterPlayer2)
        } while gameOver() == false
        print("GAME OVER")
    }
    // ***********************************************
    // MARK: - Private Methods
    // ***********************************************
    private func gameOver() ->Bool {
        let one = !player1.isValidLifeForFighters()
        let two = !player2.isValidLifeForFighters()
        return one != two
    }
    
    private func startChoosingFighter(for player: Player) ->Fighter {
        print("\(player.firstname!): Sélectionner votre combattant:")
        listingFighter(for: player)
        let fighter = consoleSelectFighter(for: player, completion: chooseFighter)
        print("\(player.firstname!): Combattant sélectionné est \(fighter.name) de type \(fighter.type.rawValue).")
        return fighter
    }
    
    private func listingFighter(for player: Player) {
        player.listingFighters.forEach { value in
            print(value)
        }
    }
    
    private func chooseFighter(for player: Player) ->Fighter? {
        let value = consoleInput()
        switch value {
        case "1":
            return player.fighters.first
        case "2":
            return player.fighters[1]
        case "3":
            return player.fighters.last
        default:
            print("Sélection invalide. Saisisser un chiffre (ex: 1, 2, 3)")
            return nil
        }
    }
    
    private func chooseFighterForCare(with player: Player) ->Fighter? {
        let fighter = chooseFighter(for: player)
        guard let value = fighter, value.type != .mage else {
            print("Vous devez sélectionner un personnage autre que le mage.")
            return nil
        }
        print("Vous avez choisi de soigner: \(fighter!.name) | \(fighter!.type.rawValue)")
        return value
    }
    
    private func startAction(
        for player: Player,
        attack: Player,
        with selectedFighter: Fighter) {
        if selectedFighter.type == .mage {
            actionCare(for: player)
        } else {
            actionAttack(for: player, attack: attack, with: selectedFighter)
        }
    }
    
    private func actionCare(for player: Player) {
        print("\(player.firstname!): Qui souhaitez vous soigner dans votre équipe ?")
        let fighter = consoleSelectFighter(for: player, completion: chooseFighterForCare)
        player.actionCare(fighter: fighter)
    }
    
    private func actionAttack(
        for player: Player,
        attack: Player,
        with selectedFighter: Fighter) {
        print("\(player.firstname!): Quel personnage de l'équipe adverse souhaitez-vous attaquer ?\n")
        listingFighter(for: attack)
        let fighter = consoleSelectFighter(for: attack, completion: chooseFighter)
        print("\(player.firstname!): Le joueur adverse qui va subir une attaque est: \(fighter.name) | \(fighter.type.rawValue)")
        attack.actionAttack(with: selectedFighter, attackFighter: fighter)
        print("\(player.firstname!): \(fighter.name) | \(fighter.type.rawValue) a subit une attaque de type \(selectedFighter.weapon) et à perdu \(selectedFighter.weapon.rawValue) points. Son niveau de vie est à \(attack.lifeFor(fighter: fighter).life)\n")
        print("•• JOUEUR SUIVANT ••")
        print("--------------------")
    }
}
