//
//  Colossus.swift
//  FightingGame
//
//  Created by Darrieumerlou on 04/08/2018.
//  Copyright © 2018 Darrieumerlou. All rights reserved.
//

import Foundation


class Colossus: Fighter {
    // ***********************************************
    // MARK: - Interface
    // ***********************************************
    private var _life: NSInteger = 90
    override var life: NSInteger {
        get { return _life }
        set { _life += newValue }
    }
    override var type: FighterType {
        get { return .colossus }
        set {}
    }
    override var weapon: Weapon {
        get { return .stick }
        set {}
    }
}
