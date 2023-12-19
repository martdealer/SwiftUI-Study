//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by zsm on 12/18/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    var body: some View {
        ZStack {
            Rectangle().fill(Color.black.gradient)
                .ignoresSafeArea()
            VStack {
                Text("Tap the Flag of")
                    .customBlueTitle()
                    .padding()
                
                VStack(spacing: 15) {
                    VStack {
                        Text(countries[correctAnswer])
                            .foregroundStyle(.white)
                            .font(.title.weight(.heavy))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                           FlagImageView(countries: countries, correctAnswer: number)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(20)
                .background(.ultraThinMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                
                Text("Score: ")
                    .foregroundStyle(.white)
                    .padding()
                    
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is ???")
        }
    }
}



#Preview {
    ContentView()
}
