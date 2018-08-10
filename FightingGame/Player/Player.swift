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
    
    func isValidFighter(name: String) ->Bool {
        return !fighters.contains(where: { element -> Bool in
            return element.name == name
        })
    }
    // ***********************************************
    // MARK: - Private Methods
    // ***********************************************
    fileprivate func addFighter(_ fighter: Fighter) {
        fighters.append(fighter)
    }
}

extension Player {
    func startNaming(position: NSInteger) {
        setPlayer(position)
    }
    
    func startComposeFighter(with player: Player) {
        setFighter(player: player)
    }
}
// ***********************************************
// MARK: - Private Methods Extension
// ***********************************************
extension Player {
    private func setPlayer(_ number: NSInteger) {
        while self.firstname == nil {
            self.firstname = choosePlayerName(number)
        }
    }
}

extension Player {
    private func setFighter(player: Player) {
        startingChooseFighter()
        repeat {
            for index in 1...3 {
                addFighter(at: index, player)
            }
        } while self.fighters.count != 3
    }
}

extension Player {
    private func choosePlayerName(_ playerNumber: NSInteger) ->String? {
        print("Joueur \(playerNumber), quel est votre nom ?")
        if let name = readLine(), name.isEmpty == false {
            print("Le nom du joueur \(playerNumber) est: \(name)")
            return name
        }
        print("Merci de saisir un nom pour le joueur \(playerNumber)")
        return nil
    }
}

extension Player {
    private func startingChooseFighter() {
        print("\n\n\(self.firstname!): Il est temps de constituer votre équipe.")
        print("Vous devez choisir 3 combattants sur les 4.")
        print("Voici les personnages:"
            + "\n1. Combattant"
            + "\n2. Mage"
            + "\n3. Nain"
            + "\n4. Colosse")
    }
}

extension Player {
    private func addFighter(at index: NSInteger, _ player: Player) {
        guard let fighter = chooseFighter(at: index, player: player) else {
            addFighter(at: index, player)
            return
        }
        self.addFighter(fighter)
    }
}

extension Player {
    private func chooseFighter(at index: NSInteger, player: Player) ->Fighter? {
        print("Choissisez le combattant numero \(index):")
        if let choice = readLine() {
            switch choice {
            case "1":
                let name = namingFighter(player: player)
                return Warrior(name: name!)
            case "2":
                let name = namingFighter(player: player)
                return Mage(name: name!)
            case "3":
                let name = namingFighter(player: player)
                return Dwarf(name: name!)
            case "4":
                let name = namingFighter(player: player)
                return Colossus(name: name!)
            default:
                print("Je ne comprends pas, merci de saisir le choix (exemple: 1, 2, 3, 4)")
            }
        }
        return nil
    }
}

extension Player {
    private func namingFighter(player: Player) ->String? {
        print("Quel est son nom ?")
        var nameFighter: String? = nil
        while nameFighter == nil {
            if let name = readLine(), name.isEmpty == false {
                if Helper.isValidFighter(name: name, player1: self, player2: player) == true {
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
}
