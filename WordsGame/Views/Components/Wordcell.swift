//
//  Wordcell.swift
//  WordsGame
//
//  Created by Вадим Виноградов on 14.06.2022.
//

import SwiftUI

struct Wordcell: View {
    
    let word: String
    
    var body: some View {
        HStack {
            Text(word)
                .foregroundColor(.white)
                .listRowSeparator(.hidden)   // между ячейками серые разделители
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .padding()
                .font(.headline.monospaced())
            Text("\(word.count)")
                .padding()
                .font(.headline.monospaced())
                .foregroundColor(.white)
        }
    }
}

struct Wordcell_Previews: PreviewProvider {
    static var previews: some View {
        Wordcell(word: "Магнит")
    }
}
