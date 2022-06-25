//
//  Player.swift
//  WordsGame
//
//  Created by Вадим Виноградов on 12.06.2022.
//

import Foundation

struct Player {
    
    let name: String
    private(set) var score = 0
    
    mutating func add(score: Int) {
        self.score += score
    }
    
    
}
