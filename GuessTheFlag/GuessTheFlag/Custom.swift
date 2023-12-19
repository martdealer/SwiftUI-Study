//
//  Custom.swift
//  GuessTheFlag
//
//  Created by zsm on 12/19/23.
//

import SwiftUI

struct CustomBlueTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.weight(.black))
            .foregroundStyle(LinearGradient(colors: [.white, .blue], startPoint: .top, endPoint: .bottom))
    }
}

extension View {
    func customBlueTitle() -> some View {
        self.modifier(CustomBlueTitle())
    }
}
