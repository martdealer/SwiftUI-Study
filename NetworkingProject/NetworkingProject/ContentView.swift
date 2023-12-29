//
//  ContentView.swift
//  NetworkingProject
//
//  Created by zsm on 12/29/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query(sort: \User.name) private var users: [User]
    @Environment(\.modelContext) var modelContext


    var body: some View {
        NavigationStack {
            List(users) { user in
                NavigationLink(value: user) {
                    Section {
                        HStack {
                            Text(user.name)
                            Spacer()
                            Image(systemName: "circle.fill")
                                .foregroundStyle(user.isActive ? .green : .red)
                            
                        }
                    }
                }
            }
            .navigationTitle("Networking Project")
            .navigationDestination(for: User.self) { user in
                DetailView(user: user)
            }
            .task {
                await fetchUsers()
            }
        }
    }
    
    func fetchUsers() async {
        // Don't re-fetch data if we already have it
        guard users.isEmpty else { return }

        do {
            let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
            let (data, _) = try await URLSession.shared.data(from: url)

            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            //users = try decoder.decode([User].self, from: data)
            let downloadedUsers = try decoder.decode([User].self, from: data)

            let insertContext = ModelContext(modelContext.container)

            
            for user in downloadedUsers {
                insertContext.insert(user)
            }
            
            try insertContext.save()

        } catch {
            print("Download failed")
        }
    }
}

#Preview {
    ContentView()
}
