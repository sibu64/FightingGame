//
//  Player.swift
//  FightingGame
//
//  Created by Darrieumerlou on 06/08/2018.
//  Copyright © 2018 Darrieumerlou. All rights reserved.
//

import Foundation

extension Player {
    static func ==(rhs: Player, lhs: Player) ->Bool {
        return rhs.firstname == lhs.firstname
    }
}

class Player: Equatable {
    // ***********************************************
    // MARK: - Interface
    // ***********************************************
    var firstname: String? = nil
    
    private var _fighters = [Fighter]()
    var fighters: [Fighter] {
        get {
            return _fighters.filter { $0.life > 0 }
        }
        set { _fighters = newValue }
    }
    // ***********************************************
    // MARK: - Implementation
    // ***********************************************
    init() { }
    
    func isValidFighter(name: String) ->Bool {
        return !fighters.contains(where: { element -> Bool in
            return element.name == name
        })
    }
    
    func actionCare(fighter: Fighter) {
        for item in fighters {
            if item.name == fighter.name {
                item.life = Weapon.power.rawValue
            }
        }
    }
    
    func actionAttack(
        with selectedFighter: Fighter,
        attackFighter: Fighter) {
        for item in fighters {
            if item.name == attackFighter.name {
                item.life = selectedFighter.weapon.rawValue
            }
        }
    }
    
    func actionDies(for fighter: Fighter) {
        for item in fighters {
            if item.name == fighter.name {
                item.life = -item.life
            }
        }
    }
    
    func actionChangeWeapon(_ weapon: Weapon, with selectedFighter: Fighter) {
        for item in fighters {
            if item.name == selectedFighter.name {
                item.weapon = weapon
            }
        }
    }
    
    func lifeFor(fighter: Fighter) ->Fighter? {
        return fighters.filter({ value -> Bool in
            return value.name == fighter.name
        }).first
    }
    
    func isValidLifeForFighters() ->Bool {
        if lastElementInArrayIsMage() {
            return false
        }
        return self.fighters.count != 0
    }
    
    func isMageDead() ->Bool {
        return lastElementInArrayIsMage()
    }
    
    var listingFighters: [String] {
        return fighters.enumerated().map { (offset, element) -> String in
            let emoji = self.emoji(for: element)
            return "\(emoji) \(offset + 1). \(element.name) | \(element.type.rawValue) | vie: \(element.life) | arme: \(element.weapon.description) | puissance: \(element.weapon.rawValue)"
        }
    }
    
    // ***********************************************
    // MARK: - Private Methods
    // ***********************************************
    private func emoji(for fighter: Fighter) ->Character {
        switch fighter.type {
        case .mage: return "🧙‍♂️"
        case .colossus: return "💪"
        case .dwarf: return "👦"
        case .warrior: return "🧝‍♂️"
        }
    }
    
    fileprivate func addFighter(_ fighter: Fighter) {
        fighters.append(fighter)
    }
    
    private func lastElementInArrayIsMage() ->Bool {
        if self.fighters.count == 1 {
            if fighters.first?.type == .mage {
                return true
            }
        }
        return false
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
        print("👨🏻 Joueur \(playerNumber), quel est votre nom ?")
        print("-----------------------------------------")
        if let name = readLine(), name.isEmpty == false {
            print("Le nom du joueur \(playerNumber) est: \(name)")
            return name
        }
        print("‼️ Merci de saisir un nom pour le joueur \(playerNumber) ‼️\n")
        return nil
    }
}

extension Player {
    private func startingChooseFighter() {
        print("\n👨🏻 \(self.firstname!): Il est temps de constituer votre équipe.")
        print("Vous devez choisir 3 combattants sur les 4.\n")
        print("Voici les personnages:"
            + "\n🧝‍♂️ 1. Guerrier"
            + "\n🧙‍♂️ 2. Mage"
            + "\n👦 3. Nain"
            + "\n💪 4. Colosse")
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
        print("\n👨🏻 \(self.firstname!): Choissisez le combattant numero \(index):")
        print("-----------------------------------------")
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
                print("‼️ Je ne comprends pas, merci de saisir le choix (exemple: 1, 2, 3, 4) ‼️")
            }
        }
        return nil
    }
}

extension Player {
    private func namingFighter(player: Player) ->String? {
        print("👨🏻 \(self.firstname!): Quel est son nom ?")
        print("-----------------------------------------")
        var nameFighter: String? = nil
        while nameFighter == nil {
            if let name = readLine(), name.isEmpty == false {
                if Helper.isValidFighter(name: name, player1: self, player2: player) == true {
                    nameFighter = name
                    break
                } else {
                    nameFighter = nil
                    print("‼️ Attention !! Le nom des combattants doit être unique. ‼️")
                }
            }
            nameFighter = nil
            print("‼️ Merci de saisir un nom ‼️")
        }
        return nameFighter
    }
}
