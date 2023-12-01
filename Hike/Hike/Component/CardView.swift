//
//  CardView.swift
//  Hike
//
//  Created by zsm on 12/1/23.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack {
            CustomBackgroundView()
               // .padding()
            
            ZStack {
                Circle()
                    .fill(LinearGradient(colors: [
                        Color("ColorIndigoMedium"), Color("ColorSalmonLight")],
                                         startPoint: .topLeading,
                                         endPoint: .bottomTrailing))
                    .frame(width: 256, height: 256)
                
                Image("image-1")
                    .resizable()
                    .scaledToFit()
            }
        }
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}
