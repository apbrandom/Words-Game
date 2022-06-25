//
//  WordsTextFiled.swift
//  WordsGame
//
//  Created by Вадим Виноградов on 23.05.2022.
//

import SwiftUI

struct WordsTextFiled: View {
  
    @State var word: Binding<String>
    var placeholder: String
    
    var body: some View {
        TextField(placeholder,
                  text: word)
            .font(.title2)
            .padding()
            .background(.white)
            .cornerRadius(12)
    }
}


struct Previews_WordsTextFiled_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
