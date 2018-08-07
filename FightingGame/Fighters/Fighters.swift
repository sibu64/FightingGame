//
//  Fighters.swift
//  FightingGame
//
//  Created by Darrieumerlou on 04/08/2018.
//  Copyright © 2018 Darrieumerlou. All rights reserved.
//

import Foundation

protocol Fighter {
    var type: FighterType { get }
    var name: String { get set }
}

enum FighterType: String {
    case mage = "Mage"
    case warrior = "Combattant"
    case dwarf = "Nain"
    case colossus = "Colosse"
}

/*class Fighters{
    var mage = Fighters(fighterName: "")
    var colossus = Fighters(fighterName: "")
    var warrior = Fighters(fighterName: "")
    var dwarf = Fighters(fighterName: "")
    var life = 100
    
    
    
    var fighterName: String? = ""
    
  init(fighterName: String){
       self.fighterName = fighterName
    }
    
    //var fighters : [String: String]=["mage": "", "colossus": "", "warrior":"", "dwarf": ""]
    
    var fighters : [(key: String, value: String)] = [(key: "mage", value: ""),(key: "colossus", value: ""), (key: "warrior", value: ""), (key: "dwarf", value: "")]
}*/
