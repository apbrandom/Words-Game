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
    
    var body: some View {
        
        VStack{
            
            TitleText(text: "WordsGame")
            
            WordsTextFiled(word: $bigWord, placeholder: "Введите большое слово")
                .padding(20)
                .padding(.top, 32)
            
            WordsTextFiled(word: $player1, placeholder: "Игрок 1")
                .cornerRadius(12)
                .padding(.horizontal, 20)
            
            WordsTextFiled(word: $player2, placeholder: "Игрок 2")
                .cornerRadius(12)
                .padding(.horizontal, 20)
            
            Button {
                isShowedGame.toggle()
            } label: {
                Text("Старт")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.horizontal, 64)
                    .padding()
                    .background(Color("FirstPlayer"))
                    .cornerRadius(40)
                    .padding(.top, 250)
            }

        }.background(Image("background"))
            .fullScreenCover(isPresented: $isShowedGame) {
                
                let player1 = Player(name: self.player1)
                let player2 = Player(name: self.player2)
                
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
