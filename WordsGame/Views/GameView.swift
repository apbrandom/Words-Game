//
//  GameView.swift
//  WordsGame
//
//  Created by Вадим Виноградов on 23.05.2022.
//

import SwiftUI

struct GameView: View {
    
    @State private var word = ""
    
    var body: some View {
        
        VStack(spacing: 16) {
            HStack {
                Button {
                    print("Quit")
                } label: {
                    Text("Выход")
                        .padding(6)
                        .padding(.horizontal)
                        .background(Color("strawberry"))
                        .cornerRadius(12)
                        .padding(6)
                        .foregroundColor(.white)
                        .font(.title2.bold())
                }
                Spacer()
            }
            
            Text("Магнитотерапия")
                .padding(20)
                .padding(.horizontal)
                .background(Color("Green"))
                .font(.largeTitle.bold())
                .cornerRadius(6)
                .foregroundColor(.white)
            
            HStack(spacing: 12) {
                
                VStack {
                    Text("0")
                        .font(.custom("", size: 60).bold().monospaced())
                        .foregroundColor(.white)
                    Text("Вася")
                        .font(.title.bold())
                        .foregroundColor(.white)
                }.padding(20)
                    .frame(width: screen.width / 2.2,
                           height: screen.width / 2.2)
                    .background(Color("LightBlue"))
                    .cornerRadius(26)
                    .shadow(color: .blue, radius: 4, x: 0, y: 0)
                
                VStack {
                    Text("0")
                        .font(.custom("", size: 60).bold().monospaced())
                        .foregroundColor(.white)
                    Text("Петя")
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
                print("Ready!")
                self.word = ""
            } label: {
                Text("Готово!")
                    .padding(12)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .background(Color("strawberry"))
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
        GameView()
    }
}
