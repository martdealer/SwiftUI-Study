//
//  NetworkingProjectApp.swift
//  NetworkingProject
//
//  Created by zsm on 12/29/23.
//

import SwiftUI
import SwiftData

@main
struct NetworkingProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
