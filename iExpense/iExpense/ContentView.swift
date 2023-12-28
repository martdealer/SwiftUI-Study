//
//  ContentView.swift
//  iExpense
//
//  Created by zsm on 12/23/23.
//

import SwiftUI

struct ContentView: View {
    @State private var expenses = Expenses()
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer()
                        Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    }
                }
                .onDelete(perform: removeItems)
            }
            
            .navigationTitle("iExpense")
            .toolbar {
                NavigationLink {
                    AddView(expenses: expenses)
                } label: {
                    Button("Add Expense", systemImage: "plus") {
                        
                    }
                    
                }
            }
            
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
