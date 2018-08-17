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

func consoleSelectFighter(
    for player: Player,
    completion: (Player)->Fighter?) ->Fighter {
    var fighter: Fighter? = nil
    while fighter == nil {
        fighter = completion(player)
    }
    return fighter!
}

func consoleSelectWeapon(completion: ()->Weapon?) ->Weapon {
    var weapon: Weapon? = nil
    while weapon == nil {
        weapon = completion()
    }
    return weapon!
}
