//
//  DetailView.swift
//  NetworkingProject
//
//  Created by zsm on 12/29/23.
//

import SwiftUI

struct DetailView: View {
    let user: User

    var body: some View {
        List {
            Section("About") {
                Text(user.about)
                    .padding(.vertical)
            }

            Section("Contact details") {
                Text("Address: \(user.address)")
                Text("Company: \(user.company)")
            }

            Section("Friends") {
                ForEach(user.friends) { friend in
                    Text(friend.name)
                }
            }
        }
        .listStyle(.grouped)
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}


//#Preview {
//    DetailView(user: <#T##User#>)
//}
