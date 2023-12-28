//
//  BookwormApp.swift
//  Bookworm
//
//  Created by zsm on 12/28/23.
//

import SwiftUI
import SwiftData

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
