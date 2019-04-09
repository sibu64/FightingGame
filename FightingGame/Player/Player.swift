//
//  Player.swift
//  FightingGame
//
//  Created by Darrieumerlou on 06/08/2018.
//  Copyright © 2018 Darrieumerlou. All rights reserved.
//

import Foundation

/// Check if two players instances are equals
extension Player {
    static func ==(rhs: Player, lhs: Player) ->Bool {
        return rhs.firstname == lhs.firstname
    }
}

class Player: Equatable {
    // ***********************************************
    // MARK: - Interface
    // ***********************************************
    /// Firstname of player - Default is nil
    var firstname: String? = nil
    
    /// List fighters for a player
    /// Return only player whose has life greater than zero
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
    
    /// Check if fighter name is unique
    /// Return true if ok
    func isValidFighter(name: String) ->Bool {
        return !fighters.contains(where: { element -> Bool in
            return element.name == name
        })
    }
    /// Care a fighter
    /// Only mage has this action
    func actionCare(fighter: Fighter) {
        for item in fighters {
            if item.name == fighter.name {
                item.life = Weapon.power.rawValue
            }
        }
    }
    
    /// Attack an opponent fighter with a fighter
    /// The life of opponent fighter decrease
    func actionAttack(
        with selectedFighter: Fighter,
        attackFighter: Fighter) {
        for item in fighters {
            if item.name == attackFighter.name {
                item.life = selectedFighter.weapon.rawValue
            }
        }
    }
    
    /// A fighter dies
    /// Generally when is anwsered a wrong question of genius
    func actionDies(for fighter: Fighter) {
        for item in fighters {
            if item.name == fighter.name {
                item.life = -item.life
            }
        }
    }
    
    /// Change weapon of fighter
    func actionChangeWeapon(_ weapon: Weapon, with selectedFighter: Fighter) {
        for item in fighters {
            if item.name == selectedFighter.name {
                item.weapon = weapon
            }
        }
    }
    
    /// Return life for a current fighter passed in parameter
    func lifeFor(fighter: Fighter) ->Fighter? {
        return fighters.filter({ value -> Bool in
            return value.name == fighter.name
        }).first
    }
    
    /// Check if life for all fighters are greater than zero,
    /// and if only mage is still in collection of fighters.
    /// Return true or false
    func isValidLifeForFighters() ->Bool {
        if lastElementInArrayIsMage() {
            return false
        }
        return self.fighters.count != 0
    }
    
    /// Check if mage fighter is dead
    func isMageDead() ->Bool {
        return lastElementInArrayIsMage()
    }
    
    /// Description of fighters in collection.
    /// Return an array of formatted string
    var listingFighters: [String] {
        return fighters.enumerated().map { (offset, element) -> String in
            let emoji = self.emoji(for: element)
            return "\(emoji) \(offset + 1). \(element.name) | \(element.type.rawValue) | vie: \(element.life) | arme: \(element.weapon.description) | puissance: \(element.weapon.rawValue)"
        }
    }
    
    // ***********************************************
    // MARK: - Private Methods
    // ***********************************************
    /// Return associated emoji for a fighter
    private func emoji(for fighter: Fighter) ->String {
        switch fighter.type {
        case .mage: return "🧙‍♂️"
        case .colossus: return "💪"
        case .dwarf: return "👦"
        case .warrior: return "🧝‍♂️"
        }
    }
    
    /// Add a fighter in fighter collection
    fileprivate func addFighter(_ fighter: Fighter) {
        fighters.append(fighter)
    }
    
    /// Check is last element in fighter collection is mage
    /// Return true or false
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
    /// Start naming player
    func startNaming(position: NSInteger) {
        setPlayer(position)
    }
    /// Start selection fighter for one player
    func startComposeFighter(with player: Player) {
        setFighter(player: player)
    }
}
// ***********************************************
// MARK: - Private Methods Extension
// ***********************************************
extension Player {
    /// Naming a player
    /// While is nil, console input is showned
    private func setPlayer(_ number: NSInteger) {
        while self.firstname == nil {
            self.firstname = choosePlayerName(number)
        }
    }
}

extension Player {
    /// Start selection of three fighters for one player
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
    /// Choose player name in console
    /// The name of player should be valid (not empty)
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
    /// Choose fighter in console
    /// Displaying selection fighters
    private func startingChooseFighter() {
        print("\n👨🏻 \(self.firstname!): Il est temps de constituer votre équipe.")
        print("Vous devez choisir 3 personnages sur les 4.\n")
        print("Voici les personnages:"
            + "\n🧝‍♂️ 1. Combattant"
            + "\n🧙‍♂️ 2. Mage"
            + "\n👦 3. Nain"
            + "\n💪 4. Colosse")
    }
}

extension Player {
    /// Add fighter in collection
    private func addFighter(at index: NSInteger, _ player: Player) {
        guard let fighter = chooseFighter(at: index, player: player) else {
            addFighter(at: index, player)
            return
        }
        self.addFighter(fighter)
    }
}

extension Player {
    /// Choose a valid fighter.
    /// Only 1,2,3,4 are authorized
    private func chooseFighter(at index: NSInteger, player: Player) ->Fighter? {
        print("\n👨🏻 \(self.firstname!): Choisissez le personnage numero \(index):")
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
    /// After selected a fighter, player should name his fighter
    /// The name of fighter in game should be unique
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
                    print("‼️ Attention !! Le nom des personnages doit être unique. ‼️")
                }
            }
            nameFighter = nil
            print("‼️ Merci de saisir un nom ‼️")
        }
        return nameFighter
    }
}
