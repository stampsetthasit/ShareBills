//
//  BillView.swift
//  ShareBills
//
//  Created by Setthasit Poosawat on 6/12/2564 BE.
//

import SwiftUI

struct ShareBillView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = 1
    @State private var tipPercentage = 0
    @FocusState private var isInputActive:Bool
    
    private let tipPercentages = [0, 10, 15, 20, 25]
    
    private var subTotal:Double { Double(checkAmount) ?? 0 }
    
    private var subTotalPerPerson:Double {
        let peopleCount = Double(numberOfPeople)
        let orderAmount = Double(checkAmount) ?? 0
        
        return orderAmount / peopleCount
    }
    
    private var tipValue:Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        return orderAmount / 100 * tipSelection
    }
    
    private var tipValuePerPerson:Double { tipValue / Double(numberOfPeople) }
    
    private var totalAmountWithTip:Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        
        return grandTotal
    }
    
    private var totalPerPerson:Double {
        let peopleCount = Double(numberOfPeople)
        let amountPerPerson = totalAmountWithTip / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                VStack(alignment: .center, spacing: 20) {
                    
                    CardView(cardLabelText: "TOTAL", totalAmount: totalAmountWithTip, subtotalAmount: subTotal, tipAmount: tipValue)
                        .frame(width: geo.size.width, height: 100)
                    
                    CardView(cardLabelText: "PER PERSON", totalAmount: totalPerPerson, subtotalAmount: subTotalPerPerson, tipAmount: tipValuePerPerson)
                        .frame(width: geo.size.width, height: 100)
                    
                    TitleView(title: "BILL AMOUNT")
                    HStack {
                        Text("$")
                            .foregroundColor(.primary)
                            .font(.system(size: 60, weight: .black, design: .rounded))
                        
                        TextField("Amount", text: $checkAmount)
                            .foregroundColor(.primary)
                            .font(.system(size: 60, weight: .black, design: .rounded))
                            .keyboardType(.decimalPad)
                            .focused($isInputActive)
                        
                            .toolbar {
                                ToolbarItemGroup(placement: .keyboard) {
                                    Spacer()
                                    Button("Done") {
                                        isInputActive = false
                                    }
                                }
                            }
                    }
                    
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    TitleView(title: "PERSON")
                    PeopleCountView(personCount: $numberOfPeople)
                }
            }
            .padding()
            .navigationTitle("ShareBill")
        }
    }
}


struct BillView_Previews: PreviewProvider {
    static var previews: some View {
        ShareBillView()
    }
}
