//
//  Helper+Console.swift
//  FightingGame
//
//  Created by Darrieumerlou on 13/08/2018.
//  Copyright © 2018 Darrieumerlou. All rights reserved.
//

import Foundation

func consoleInput() ->String? {
    print("\nChoix:")
    if let choice = readLine(), choice.isEmpty == false {
        return choice
    }
    return nil
}

func consolePrintWeapon(_ weapons: [Weapon]) {
    let values = weapons.enumerated().map({ value -> String in
        return "\(value.offset + 1). \(value.element.description)"
    })
    values.forEach { element in
        print(element)
    }
}

func consoleSelectFighter(
    for player: Player,
    completion: (Player)->Fighter?) ->Fighter {
    var fighter: Fighter? = nil
    while fighter == nil {
        fighter = completion(player)
    }
    return fighter!
}

func consoleSelectWeapon(
    with weapons: [Weapon],
    completion: ([Weapon])->Weapon?) ->Weapon {
    var weapon: Weapon? = nil
    while weapon == nil {
        weapon = completion(weapons)
    }
    return weapon!
}

func consolePrintGenius(
    with question: Genius.QuestionAnswer,
    completion: (Genius.QuestionAnswer)->Bool?) ->Bool {
    var answerIsGood: Bool? = nil
    while answerIsGood == nil {
        answerIsGood = completion(question)
    }
    return answerIsGood!
}

func randomNumber(min: Int, max:Int) ->Int {
    return min + Int(arc4random_uniform(UInt32(max - min + 1)))
}
