//
//  ContentView.swift
//  WeSplit
//
//  Created by zsm on 12/18/23.
//

import SwiftUI

struct ContentView: View {
    @FocusState private var amountIsFocused: Bool
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 0
    
    @State private var isTipZero: Bool = false
    let tipPercentages = [0, 10, 15, 20, 25]
    
    
    var body: some View {
        
        var totalPerPerson: Double {
            let peopleCount = Double(numberOfPeople + 2)
            let tipSelection = Double(tipPercentage)
            
            let tipValue = checkAmount / 100 * tipSelection
            let grandTotal = checkAmount + tipValue
            let amountPerPerson = grandTotal / peopleCount
            
            return amountPerPerson
        }
        
        var grandTotal: Double {
            let peopleCount = Double(numberOfPeople + 2)
            let tipSelection = Double(tipPercentage)
            
            let tipValue = checkAmount / 100 * tipSelection
            let grandTotal = checkAmount + tipValue
            
            return grandTotal
        }
        
        NavigationStack {
            Form {
                Section("Amount and split") {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .foregroundStyle(.blue)
                        .focused($amountIsFocused)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.menu)
                    
                }
                
                Section("Tip percentage") {
                    Picker("", selection: $tipPercentage) {
                        ForEach(0...100, id: \.self) {
                            Text($0, format: .percent)
                            
                            
                        }
                        
                    }
                    .pickerStyle(.navigationLink)
                    .onChange(of: tipPercentage) {
                        isTipZero = ($0 == 0)
                    }
                    
                    
                    
                    
                }
                Section ("Total amount with Tips") {
                    Text(grandTotal, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .foregroundStyle(isTipZero ? .red : .black)
                    
                    
                }
                
                Section("Amount per person") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
            
        }
        
        
    }
}

#Preview {
    ContentView()
}
