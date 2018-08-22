//
//  Genius.swift
//  FightingGame
//
//  Created by Darrieumerlou on 22/08/2018.
//  Copyright © 2018 Darrieumerlou. All rights reserved.
//

import Foundation

class Genius {
    // ***********************************************
    // MARK: - Interface
    // ***********************************************
    typealias QuestionAnswer = (question: String, anwser: String)
    
    private var questions: [QuestionAnswer] {
        return [
            ("Je préfére Game Of Thrones ou Glee ?", "Game Of Thrones"),
            ("Marvel ou DC Comics ?", "DC Comics"),
            ("Vrai ou faux, après plus de 73 ans de recherche l'épave du Titanic fut retrouvé en 1985 ?", "vrai"),
            ("Vrai ou faux, les 52 otages de l'ambassade américaine en Iran ont été libéré le jour de l'investiture du président Ronald Regan ?", "vrai"),
            ("Qu'est ce qui est jaune est qui attend ?", "Jonathan"),
            ("Quelle est la couleur du cheval blanc d'Henrie IV ?", "Blanc"),
            ("Qui suis-je ? J'ai affronté Mohammed Ali dans le combat surnommé \"The Rumble In The Jungle\".", "George Foreman"),
            ("Qui à écrit le seigneur des anneaux ?", "Tolkien"),
            ("Quel philosophe à écrit \"Lorsque l'on se cogne la tête contre un pot et que cela sonne creux, çà n'ait pas forcément le pot qui est vide\"", "Confucius"),
            ("Quel philosophe à écrit \"La vie est un mystère qu'il faut vivre et non un problème à résoudre\" ?", "Gandhi")
        ]
    }
    
    var getRandomQuestion: QuestionAnswer {
        let number = randomNumber(min: 0, max: 10)
        return questions[number]
    }
}
