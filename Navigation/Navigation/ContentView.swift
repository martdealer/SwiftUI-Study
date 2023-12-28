//
//  ContentView.swift
//  Navigation
//
//  Created by zsm on 12/26/23.
//

import SwiftUI

struct ContentView: View {
    @State private var title = "SwiftUI"

    var body: some View {
        NavigationStack {
            Text("Hello, world!")
                .navigationTitle($title)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}



#Preview {
    ContentView()
}
