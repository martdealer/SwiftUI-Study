//
//  FlagImageView.swift
//  GuessTheFlag
//
//  Created by zsm on 12/19/23.
//

import SwiftUI

struct FlagImageView: View {
    var countries: [String]
    var correctAnswer: Int

    
    var body: some View {
        Image(countries[correctAnswer])
            .clipShape(.buttonBorder)
            .shadow(radius: 5)    }
}

//#Preview {
//    FlagImageView()
//}
