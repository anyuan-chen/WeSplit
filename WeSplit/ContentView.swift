//
//  ContentView.swift
//  WeSplit
//
//  Created by Andrew Chen on 2021-05-01.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = "0"
    @State private var tipPercentage = 2
    var totalAmount: Double{
        let totalCheck: Double? = Double(checkAmount) ?? 0.0;
        let numberPeople: Double = Double(numberOfPeople) ?? 0.0;
        var finalValue: Double = totalCheck!/numberPeople;
        let totalTip: Double = Double(tipPercentages[tipPercentage])/100.0;
        finalValue += totalTip * finalValue;
        return finalValue;
    }
    var amountPerPerson: Double {
        let finalValue: Double = totalAmount;
        return round(finalValue*100)/100
    }
    let tipPercentages = [0,10,15,20,25]
    
    var body: some View {
        
        NavigationView {
            Form{
                Section{
                    TextField("Amount", text:$checkAmount)
                        .keyboardType(.decimalPad)
                    
                    TextField("Number of People", text:$numberOfPeople)
                        .keyboardType(.numberPad)
                }
                Section(header: (Text("Tip"))){
                    Picker("Tip Percentage", selection:
                            $tipPercentage){
                        ForEach (0..<tipPercentages.count){
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header:Text("Total Amount Due")){
                    Text("$\(totalAmount, specifier: "%.2f")")
                }
                Section(header: Text("Amount Per Person")){
                    Text("$\(amountPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("WeSplit")
            .foregroundColor(tipPercentage == 0 ? .red : .blue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
