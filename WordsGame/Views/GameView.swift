//
//  GameView.swift
//  WordsGame
//
//  Created by Вадим Виноградов on 23.05.2022.
//

import SwiftUI

struct GameView: View {
    
    @State private var word = ""
    
    var viewModel: GameViewModel
    
    var body: some View {
        
        VStack(spacing: 16) {
            HStack {
                Button {
                    print("Quit")
                } label: {
                    Text("Выход")
                        .padding(6)
                        .padding(.horizontal)
                        .background(Color("cristalBlue"))
                        .cornerRadius(12)
                        .padding(6)
                        .foregroundColor(.white)
                        .font(.title2.bold())
                }
                Spacer()
            }
            
            Text(viewModel.word)
                .padding(20)
                .padding(.horizontal)
                .background(Color("Green"))
                .font(.title)
                .cornerRadius(6)
                .foregroundColor(.white)
            
            HStack(spacing: 12) {
                
                VStack {
                    Text("\(viewModel.player1.score)")
                        .font(.custom("", size: 60).bold().monospaced())
                        .foregroundColor(.white)
                    Text("\(viewModel.player1.name)")
                        .font(.title.bold())
                        .foregroundColor(.white)
                }.padding(20)
                    .frame(width: screen.width / 2.2,
                           height: screen.width / 2.2)
                    .background(Color("LightBlue"))
                    .cornerRadius(26)
                    .shadow(color: .blue, radius: 4, x: 0, y: 0)
                
                VStack {
                    Text("\(viewModel.player2.score)")
                        .font(.custom("", size: 60).bold().monospaced())
                        .foregroundColor(.white)
                    Text("\(viewModel.player2.name)")
                        .font(.title.bold())
                        .foregroundColor(.white)
                }.padding(20)
                    .frame(width: screen.width / 2.2,
                           height: screen.width / 2.2)
                    .background(Color("LightRed"))
                    .cornerRadius(26)
                    .shadow(color: .red, radius: 4, x: 0, y: 0)
                
            }
            
            WordsTextFiled(word: $word, placeholder: "Ваше слово...")
                .padding(.horizontal)
            
            Button {
                let score = viewModel.check(word: word)
                if score > 1 {
                    self.word = ""
                }
                
            } label: {
                Text("Готово!")
                    .padding(12)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .background(Color("cristalBlue"))
                    .cornerRadius(12)
                    .font(.title2.bold())
                    .padding(.horizontal)
                
            }
            
            List {
                
            }.listStyle(.plain)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            
        }.background(Image("background"))
        
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(viewModel: GameViewModel(player1: Player(name: "Вася"),
                                          player2: Player(name: "Федя"),
                                          word: "Рекогнасцировка"))
    }
}
