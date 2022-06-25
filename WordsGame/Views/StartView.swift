//
//  ContentView.swift
//  WordsGame
//
//  Created by Вадим Виноградов on 23.05.2022.
//

import SwiftUI

struct StartView: View {
    
    @State var bigWord = ""
    @State var player1 = ""
    @State var player2 = ""
    
    @State var isShowedGame = false
    @State var isAlertPresented = false
    
    var body: some View {
        
        VStack{
            
            TitleText(text: "WordsGame")
            
            WordsTextFiled(word: $bigWord, placeholder: "Введите большое слово")
                .padding(20)
                .padding(.top, 32)
            
            WordsTextFiled(word: $player1, placeholder: "Player 2")
                .cornerRadius(12)
                .padding(.horizontal, 20)
            
            WordsTextFiled(word: $player2, placeholder: "Player 2")
                .cornerRadius(12)
                .padding(.horizontal, 20)
            
            Button {
                if bigWord.count > 7 {
                    isShowedGame.toggle()
                } else {
                    self.isAlertPresented.toggle()
                }
                
                
            } label: {
                Text("Start")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.horizontal, 64)
                    .padding()
                    .background(Color("FirstPlayer"))
                    .cornerRadius(40)
                    .padding(.top)
            }
            
        }.background(Image("background"))
            .alert("Big word is to short",
                   isPresented: $isAlertPresented,
                   actions: {
                Text("OK!")
            })
            .fullScreenCover(isPresented: $isShowedGame) {
                // по умолчанию создает имена игроков без необходимости написания вручную
                let name1 = player1 == "" ? "Player 1" : player1
                let name2 = player1 == "" ? "Player 2" : player2
                
                let player1 = Player(name: name1)
                let player2 = Player(name: name2)
                
                let gameViewModel = GameViewModel(player1: player1,
                                                  player2: player2,
                                                  word: bigWord)
                
                GameView(viewModel: gameViewModel)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
