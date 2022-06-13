//
//  GameViewModel.swift
//  WordsGame
//
//  Created by Вадим Виноградов on 12.06.2022.
//

import Foundation

class GameViewModel: ObservableObject {
    
    @Published var player1: Player
    @Published var player2: Player
    @Published var words = [String]()
    
    let word: String
    var isFirst = true
    
    init(player1: Player, player2: Player, word: String) {
        self.player1 = player1
        self.player2 = player2
        self.word = word.uppercased()
    }
    
    func validate(word: String) -> Bool {
        
        let word = word.uppercased()
        
        guard word != self.word else {
            print("Думаешь самый умный? Составленое слово не должно быть исходным словом")
            return false
        }
        
        guard !(words.contains(word)) else {
            print("Прояви фантазию! Придумай новое слово, которое не было составлено ранее!")
            return false
        }
        
        guard word.count > 1 else {
            print("Одна буква это не слово!")
            return false
        }
        
        return true
        
    }
    
    func wordToChars(word: String) -> [Character] {
        
        var chars = [Character]()
        
        for char in word.uppercased() {
            chars.append(char)
        }
        
        return chars
    }
    
    func check(word: String) -> Int {
        guard self.validate(word: word) else {
            return 0
        }
        
        var bigWordArray = wordToChars(word: self.word)
        let smallWordArray = wordToChars(word: word)
        var result = ""
        
        for char in smallWordArray {
            if bigWordArray.contains(char) {
                result.append(char)
                var i = 0
                while bigWordArray[i] != char {
                    i += 1
                }
                bigWordArray.remove(at: i)
                
            } else {
                print("Такое слово не может быть составлено")
                return 0
            }
        }
        
        guard result == word.uppercased() else {
            print("Неизвестная ошибка")
            return 0
        }
        
        words.append(result)
        
        if isFirst {
            player1.add(score: result.count)
        } else {
            player2.add(score: result.count)
        }
        
        isFirst.toggle()
        
        return result.count
        
    }
}