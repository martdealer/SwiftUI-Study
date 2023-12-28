//
//  ContentView.swift
//  HabitTracking
//
//  Created by zsm on 12/27/23.
//

import SwiftUI

struct ContentView: View {
    @State private var data = Activities()
    
    @State private var addingNewActivity = false


    var body: some View {
        NavigationStack {
            List(data.activities) { activity in
                NavigationLink {
                    ActivityView(data: data, activity: activity)
                } label: {
                    HStack {
                        Text(activity.title)
                        Spacer()

                        Text(String(activity.completionCount))
                    }
                }
            }
            .navigationTitle("Habit Tracking")
            .toolbar {
                Button("Add new activity", systemImage: "plus") {
                    addingNewActivity.toggle()
                }
            }
            .sheet(isPresented: $addingNewActivity) {
                AddActivity(data: data)
            }
        }
    }
}


#Preview {
    ContentView()
}
