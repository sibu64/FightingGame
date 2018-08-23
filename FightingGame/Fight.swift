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
    private var genius = Genius()
    private var players: [Player] {
        return [player1, player2]
    }
    // ***********************************************
    // MARK: - Implementation
    // ***********************************************
    public init(player1: Player, player2: Player) {
        self.player1 = player1
        self.player2 = player2
    }
    
    func start() {
        print("\n•• 🗡️ LE COMBAT VA COMMENCER 🗡️ ••")
        print("-----------------------------------------\n")
        repeat {
            let fighterPlayer1 = startChoosingFighter(for: player1)
            if displayChoosingWeapon(with: fighterPlayer1) {
                startChoosingWeapon(for: player1, with: fighterPlayer1)
            }
            startAction(for: player1, attack: player2, with: fighterPlayer1)
            if displayGenius() {
                startGenius(for: player1, with: fighterPlayer1)
            }
            print("\n➡️ JOUEUR SUIVANT")
            print("--------------------")
            guard gameOver() == false else { break }
            let fighterPlayer2 = startChoosingFighter(for: player2)
            if displayChoosingWeapon(with: fighterPlayer2) {
                startChoosingWeapon(for: player1, with: fighterPlayer1)
            }
            startAction(for: player2, attack: player1, with: fighterPlayer2)
            if displayGenius() {
                startGenius(for: player2, with: fighterPlayer2)
            }
            print("\n➡️ JOUEUR SUIVANT")
            print("--------------------")
        } while gameOver() == false
        print("\n\n")
        print("•• GAME OVER ••")
        
        let winnerPlayer = winner()
        let looserPlayer = looser()
        if looserPlayer.isMageDead() {
            print("•• \(looserPlayer.firstname!): Vous ne pouvez plus attaquer.\n Il ne reste que le Mage dans votre équipe. ••")
        }
        print("•• Le vainqueur est: \(winnerPlayer.firstname!) ••")
    }
    // ***********************************************
    // MARK: - Private Methods
    // ***********************************************
    func startGenius(for player: Player, with fighter: Fighter) {
        print("\n•• 🧞 GÉNIE 🧞 ••")
        print("-----------------------------------------")
        print("‼️ Répondez juste sinon vous mourrez ‼️\n")
        let question = genius.getRandomQuestion
        print("🧞 Génie: \(question.question)")
        let answerIsGood = consolePrintGenius(with: question, completion: choosingAnswerForGenius)
        if answerIsGood == true {
            print("🏆 BRAVO, la partie continue pour votre personnage 🏆")
        } else {
            player.actionDies(for: fighter)
            print("\n")
            print("🧞 Génie: La réponse est fausse")
            print("🧞 Génie: La bonne réponse était: \(question.anwser)")
            print("🧞 Génie: Votre personnage \(fighter.name) | \(fighter.type.rawValue) est mort ⚰️ \n")
        }
    }
    
    private func choosingAnswerForGenius(with question: Genius.QuestionAnswer) ->Bool? {
        if let value = consoleInput() {
            return value.lowercased() == question.anwser.lowercased()
        }
        print("‼️ Merci de rentrer une réponse ‼️")
        return nil
    }
    
    
    private func gameOver() ->Bool {
        let one = !player1.isValidLifeForFighters()
        let two = !player2.isValidLifeForFighters()
        return one != two
    }
    
    private func winner() ->Player {
        if player1.isValidLifeForFighters() {
            return player1
        }
        return player2
    }
    
    private func looser() ->Player {
        if player1.isValidLifeForFighters() {
            return player2
        }
        return player1
    }
    
    private func displayChoosingWeapon(with fighter: Fighter) ->Bool {
        guard fighter.type == .mage else {
            let number = randomNumber(min: 0, max: 3)
            return number == 2
        }
        return false
    }
    
    private func displayGenius() ->Bool {
        let number = randomNumber(min: 0, max: 3)
        return number == 3
    }
    
    private func startChoosingFighter(for player: Player) ->Fighter {
        print("👨🏻 \(player.firstname!): Sélectionner votre combattant:")
        print("-----------------------------------------")
        listingFighter(for: player)
        let fighter = consoleSelectFighter(for: player, completion: chooseFighter)
        print("👨🏻 \(player.firstname!): Combattant sélectionné est \(fighter.name) de type \(fighter.type.rawValue).")
        return fighter
    }
    
    private func startChoosingWeapon(for player: Player, with fighter: Fighter) {
        print("👨🏻 \(player.firstname!): Vous devez changer d'arme !\n")
        print("👨🏻 \(player.firstname!): Choisissez parmis ces propositions:")
        print("-----------------------------------------")
        let weapons = Weapon.listing(for: fighter)
        consolePrintWeapon(weapons)
        let weapon = consoleSelectWeapon(with: weapons, completion: chooseWeapon)
        player.actionChangeWeapon(weapon, with: fighter)
        print("👨🏻 \(player.firstname!): L'arme de \(fighter.name) | \(fighter.type.rawValue) est maintenant \(weapon.description)\n")
    }
    
    private func chooseWeapon(with weapons: [Weapon]) ->Weapon? {
        let value = consoleInput()
        switch value {
        case "1": return weapons.first!
        case "2": return weapons.last!
        default:
            print("‼️ Sélection invalide. Saisisser un chiffre (ex: 1, 2, 3) ‼️")
            return nil
        }
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
            if player.fighters.count >= 2 {
                return player.fighters[1]
            }
            return nil
        case "3":
            if player.fighters.count == 3 {
                return player.fighters.last
            }
            return nil
        default:
            print("‼️ Sélection invalide. Saisisser un chiffre (ex: 1, 2, 3) ‼️")
            return nil
        }
    }
    
    private func chooseFighterForCare(with player: Player) ->Fighter? {
        let fighter = chooseFighter(for: player)
        guard let value = fighter, value.type != .mage else {
            print("‼️ Vous devez sélectionner un personnage autre que le mage ‼️")
            return nil
        }
        print("👨🏻 \(player.firstname!): Vous avez choisi de soigner: \(fighter!.name) | \(fighter!.type.rawValue)")
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
        print("👨🏻 \(player.firstname!): Qui souhaitez vous soigner dans votre équipe ?")
        let fighter = consoleSelectFighter(for: player, completion: chooseFighterForCare)
        player.actionCare(fighter: fighter)
    }
    
    private func actionAttack(
        for player: Player,
        attack: Player,
        with selectedFighter: Fighter) {
        print("👨🏻 \(player.firstname!): Quel personnage de l'équipe adverse souhaitez-vous attaquer ?")
        print("-----------------------------------------\n")
        listingFighter(for: attack)
        let fighter = consoleSelectFighter(for: attack, completion: chooseFighter)
        print("👨🏻 \(player.firstname!): Le joueur adverse qui va subir une attaque est: \(fighter.name) | \(fighter.type.rawValue)")
        attack.actionAttack(with: selectedFighter, attackFighter: fighter)
        print("👨🏻 \(player.firstname!): \(fighter.name) | \(fighter.type.rawValue) a subit une attaque de type \(selectedFighter.weapon) et à perdu \(selectedFighter.weapon.rawValue) points.\n \(consoleLife(player: attack, for: fighter))")
    }
    
    private func consoleLife(player: Player, for fighter: Fighter) ->String {
        let life = player.lifeFor(fighter: fighter)?.life
        return life != nil ?
            "❤️ Son niveau de vie est à \(life!)\n" :
        "❤️ \(fighter.name) est mort.\n"
    }
}
