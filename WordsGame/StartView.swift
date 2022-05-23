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
    
    var body: some View {
        
        VStack{
            Text("Words Game")
                .padding()
                .font(.largeTitle.bold())
                .cornerRadius(16)
                .frame(maxWidth: .infinity)
                .background(Color("FirstPlayer"))
                .foregroundColor(.white)
                
            
            TextField("Введиьте длинное слово",
                      text: $bigWord)
                .font(.title2)
                .padding()
                .background(.white)
                .cornerRadius(12)
                .padding(20)
                .padding(.top, 32)
            
            TextField("Игрок 1",
                      text: $player1)
                .font(.title2)
                .padding()
                .background(.white)
                .cornerRadius(12)
                .padding(.horizontal, 20)
            
            TextField("Игрок 2",
                      text: $player2)
                .font(.title2)
                .padding()
                .background(.white)
                .cornerRadius(12)
                .padding(.horizontal, 20)
            
            Button {
                print("Start Button Tapped")
            } label: {
                Text("Старт")
                    .font(.title2)
                    .foregroundColor(.white)
                p
                    .background(Color("FirstPlayer"))
            }

            
        }.background(Image("background"))
            
    }
        
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
