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
    @State private var confirmPresented = false
    @State private var isAlertPresent = false
    @State var alertText = ""
    
    @Environment(\.dismiss) var dismis          // Дисмиска, выход на прошый экран
    
    var body: some View {
        
        VStack(spacing: 16) {
            HStack {
                Button {
                    confirmPresented.toggle()    // кнопка выхода
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
                    .shadow(color: viewModel.isFirst ? .blue : .clear,
                            radius: 4, x: 0, y: 0)
                
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
                    .shadow(color: viewModel.isFirst ? .clear : .red,
                            radius: 4, x: 0, y: 0)
                
            }
            
            WordsTextFiled(word: $word, placeholder: "Ваше слово...")
                .padding(.horizontal)
            
            Button {
                
                var score = 0
                
                do {
                    try score = viewModel.check(word: word)
                } catch WordError.beforeWord {
                    alertText = "Прояви фантазию! Придумай новое слово, которое не было составлено ранее!"
                    isAlertPresent.toggle()
                } catch WordError.littleWord {
                    alertText = "Слишком короткое слово!"
                    isAlertPresent.toggle()
                } catch WordError.theSameWord {
                    alertText = "Думаешь самый умный? Составленое слово не должно быть исходным словом!"
                    isAlertPresent.toggle()
                } catch WordError.wrongWord {
                    alertText = "Такое слово не может быть составлено"
                    isAlertPresent.toggle()
                } catch {
                    alertText = "Неизвестная ошибка"
                    isAlertPresent.toggle()
                }
                
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
            
            List {                 // таблица
                ForEach(0 ..< self.viewModel.words.count,
                        id: \.description) {item in
                    Wordcell(word: self.viewModel.words[item])
                        .background(item % 2 == 0 ? Color("LightBlue") : Color("LightRed"))
                        .listRowInsets(EdgeInsets())
                }
            }.listStyle(.plain)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            
        }.background(Image("background"))
            .confirmationDialog("Do you want to fihish game?",
                                isPresented: $confirmPresented,
                                titleVisibility: .visible) {          // видимость title
                Button(role: .destructive) {      // destructive красит кнопку в красный цвет
                    self.dismis()
                } label: {
                    Text("Yes")
                }
                
                Button(role: .cancel) { } label: {
                    Text("No")
                }
                
            }
                                .alert(alertText,
                                       isPresented: $isAlertPresent) {
                                    Text("OK")
                                }
    }
    
    struct GameView_Previews: PreviewProvider {
        static var previews: some View {
            GameView(viewModel: GameViewModel(player1: Player(name: "Вася"),
                                              player2: Player(name: "Федя"),
                                              word: "Рекогнасцировка"))
        }
    }
}
