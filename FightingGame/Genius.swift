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
    /// Alias for Tuple
    typealias QuestionAnswer = (question: String, answer: String)
    
    /// List of question/answer of Genius
    private var questions: [QuestionAnswer] {
        return [
            ("Je préfére Game Of Thrones ou Glee ?", "Game Of Thrones"),
            ("Marvel ou DC Comics ?", "DC Comics"),
            ("Vrai ou faux, après plus de 73 ans de recherche l'épave du Titanic fut retrouvée en 1985 ?", "Vrai"),
            ("Vrai ou faux, les 52 otages de l'ambassade américaine en Iran ont été libérés le jour de l'investiture du président Ronald Regan ?", "Vrai"),
            ("Qu'est ce qui est jaune est qui attend ?", "Jonathan"),
            ("Quelle est la couleur du cheval blanc d'Henri IV ?", "Blanche"),
            ("Qui suis-je ? J'ai affronté Mohammed Ali dans le combat surnommé \"The Rumble In The Jungle\".", "George Foreman"),
            ("Qui a écrit le seigneur des anneaux ?", "Tolkien"),
            ("Quel philosophe a écrit \"Lorsque l'on se cogne la tête contre un pot et que cela sonne creux, ce n'est pas forcément le pot qui est vide\"", "Confucius"),
            ("Quel philosophe a écrit \"La vie est un mystère qu'il faut vivre et non un problème à résoudre\" ?", "Gandhi")
        ]
    }
    /// Get a random question of Genius
    var getRandomQuestion: QuestionAnswer {
        let number = randomNumber(min: 0, max: 9)
        return questions[number]
    }
}
