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
    var player1 = Player()
    var player2 = Player()
    // ***********************************************
    // MARK: - Implementation
    // ***********************************************
    func gamePlay() {
        print("Bonjour, bienvenue sur le jeux Fighters.")
        print("Vous allez personnaliser vos équipes.")
        print("Merci de choisir le nom des deux joueurs.")
    }
    
    func choosePlayerName(_ playerNumber: NSInteger) ->String? {
        print("Joueur \(playerNumber), quel est votre nom ?")
        if let name = readLine(), name.isEmpty == false {
            print("Le nom du joueur \(playerNumber) est: \(name)")
            return name
        }
        print("Merci de saisir un nom pour le joueur \(playerNumber)")
        return nil
    }
    
    func startingChooseFighter(for player: Player) {
        print("\n\n\(player.firstname!): Il est temps de constituer votre équipe.")
        print("Vous devez choisir 3 combattants sur les 4.")
        print("Voici les personnages:"
            + "\n1. Combattant"
            + "\n2. Mage"
            + "\n3. Nain"
            + "\n4. Colosse")
    }
    
    func chooseFighter(for player: Player, _ number: NSInteger) ->Fighter? {
        print("Choissisez le personnage numero \(number)")
        if let choice = readLine() {
            switch choice {
            case "1":
                var name: String?
                while name == nil {
                    name = namingFighter()
                }
                print("Personnage \(number) s'appel \(name!)")
                return Warrior(name: name!)
            //case "2":
                /*let name = namingFighter()
                print("Le nom de votre personnage est \(name)")
                return Mage(name: name)*/
            default: print("Je ne comprends pas, merci de saisir le choix (exemple: 1, 2, 3, 4)")
            }
        }
        return nil
    }
    
    func namingFighter() ->String? {
        print("Quel est son nom ?")
        if let name = readLine(), name.isEmpty == false {
            return name
        }
        print("Merci de saisir un nom")
        return nil
    }
    
    func start() {
        gamePlay()
        setPlayer(player1, 1)
        setPlayer(player2, 2)
        startingChooseFighter(for: player1)
        
        while player1.fighters.count != 3 {
            for index in 1...3 {
                while chooseFighter(for: player1, index) == nil {
                    if let fighter = chooseFighter(for: player1, index) {
                        player1.addFighter(fighter)
                    }
                }
            }
        }
    }
}

extension Game {
    func setPlayer(_ player: Player, _ number: NSInteger) {
        while player.firstname == nil {
            player.firstname = choosePlayerName(number)
        }
    }
}
