//
//  Team.swift
//  FightingGame
//
//  Created by Darrieumerlou on 09/08/2018.
//  Copyright © 2018 Darrieumerlou. All rights reserved.
//

import Foundation

class Team {
    // ***********************************************
    // MARK: - Interface
    // ***********************************************
    public var player1 = Player()
    public var player2 = Player()
    // ***********************************************
    // MARK: - Implementation
    // ***********************************************
    func start() {
        print("Bonjour, bienvenue sur le jeux Fighters.")
        print("Vous allez personnaliser vos équipes.")
        print("Merci de choisir le nom des deux joueurs.")
        setPlayer(player1, 1)
        setPlayer(player2, 2)
        setFighter(for: player1)
        setFighter(for: player2)
    }
    // ***********************************************
    // MARK: - Private Methods
    // ***********************************************
    private func choosePlayerName(_ playerNumber: NSInteger) ->String? {
        print("Joueur \(playerNumber), quel est votre nom ?")
        if let name = readLine(), name.isEmpty == false {
            print("Le nom du joueur \(playerNumber) est: \(name)")
            return name
        }
        print("Merci de saisir un nom pour le joueur \(playerNumber)")
        return nil
    }
    
    private func startingChooseFighter(for player: Player) {
        print("\n\n\(player.firstname!): Il est temps de constituer votre équipe.")
        print("Vous devez choisir 3 combattants sur les 4.")
        print("Voici les personnages:"
            + "\n1. Combattant"
            + "\n2. Mage"
            + "\n3. Nain"
            + "\n4. Colosse")
    }
    
    private func chooseFighter(for player: Player, _ number: NSInteger) ->Fighter? {
        print("Choissisez le combattant numero \(number):")
        if let choice = readLine() {
            switch choice {
            case "1":
                let name = namingFighter()
                return Warrior(name: name!)
            case "2":
                let name = namingFighter()
                return Mage(name: name!)
            case "3":
                let name = namingFighter()
                return Dwarf(name: name!)
            case "4":
                let name = namingFighter()
                return Colossus(name: name!)
            default:
                print("Je ne comprends pas, merci de saisir le choix (exemple: 1, 2, 3, 4)")
            }
        }
        return nil
    }
    
    private func namingFighter() ->String? {
        print("Quel est son nom ?")
        var nameFighter: String? = nil
        while nameFighter == nil {
            if let name = readLine(), name.isEmpty == false {
                if isValidFighter(name: name) == true {
                    nameFighter = name
                    break
                } else {
                    nameFighter = nil
                    print("Attention !! Le nom des combattants doit être unique.")
                }
            }
            nameFighter = nil
            print("Merci de saisir un nom")
        }
        return nameFighter
    }
    
    private func addFighter(for player: Player, at index: NSInteger) {
        guard let fighter = chooseFighter(for: player, index) else {
            addFighter(for: player, at: index)
            return
        }
        player.addFighter(fighter)
    }
    
    private func isValidFighter(name: String) ->Bool {
        return player1.isValidFighter(name: name)
            && player2.isValidFighter(name: name)
    }
}

extension Team {
    private func setPlayer(_ player: Player, _ number: NSInteger) {
        while player.firstname == nil {
            player.firstname = choosePlayerName(number)
        }
    }
}

extension Team {
    func setFighter(for player: Player) {
        startingChooseFighter(for: player)
        repeat {
            for index in 1...3 {
                addFighter(for: player, at: index)
            }
        } while player.fighters.count != 3
    }
}
