//
//  TitleText.swift
//  WordsGame
//
//  Created by Вадим Виноградов on 23.05.2022.
//

import SwiftUI

struct TitleText: View {
   
    @State var text: String
    
    var body: some View {
        
        Text(text)
            .padding()
            .font(.largeTitle.bold())
            .cornerRadius(16)
            .frame(maxWidth: .infinity)
            .background(Color("FirstPlayer"))
            .foregroundColor(.white)
            .padding(.top)
    }
}

struct TitleText_Previews: PreviewProvider {
    static var previews: some View {
        TitleText(text: "Магнитотерапия")
    }
}
