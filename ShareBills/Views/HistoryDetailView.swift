//
//  HistoryDetailView.swift
//  ShareBills
//
//  Created by Setthasit Poosawat on 8/12/2564 BE.
//

import SwiftUI

struct HistoryDetailView: View {
    @ObservedObject var historyBill:History
    let sizeMedium = 18
    var body: some View {
        VStack(spacing: 20) {
            Text(historyBill.bill_name!)
                .font(.system(size: 40, weight: .black, design: .rounded))
                .padding(.bottom, 14)
            VStack {
                Rectangle()
                    .foregroundColor(Color.black)
                    .frame(width: .infinity, height: 2)
                HStack {
                    Text("\(historyBill.timestamp!, style: .date)")
                    Spacer()
                    Text("\(historyBill.timestamp!, style: .time)")
                }
                Rectangle()
                    .foregroundColor(Color.black)
                    .frame(width: .infinity, height: 2)
            }
            .padding()
            
            VStack(spacing: 10) {
                HStack {
                    Text("AMOUNT")
                    Spacer()
                    Text("\(historyBill.total, specifier: "%.2f" )")
                }
                .font(.system(size: 30, weight: .bold, design: .rounded))
                HStack {
                    Text("Sub-total")
                    Spacer()
                    Text("\(historyBill.subtotal, specifier: "%.2f")")
                }
                .font(.system(size: CGFloat(sizeMedium), weight: .medium, design: .rounded))
                HStack {
                    Text("Per Person")
                    Spacer()
                    Text("\(historyBill.total_person, specifier: "%.2f" )")
                }
                .font(.system(size: CGFloat(sizeMedium), weight: .medium, design: .rounded))
                HStack {
                    Text("Tip")
                    Spacer()
                    Text("\(historyBill.tip, specifier: "%.2f")")
                }
                .font(.system(size: CGFloat(sizeMedium), weight: .medium, design: .rounded))
                .padding(.bottom)
                Rectangle()
                    .foregroundColor(Color.black)
                    .frame(width: .infinity, height: 2)
                    .padding(.bottom)
                VStack {
                    Text("People")
                    Text("\(historyBill.people)")
                }
                .font(.system(size: 38, weight: .heavy, design: .rounded))
            }
            .padding()
        }
        .padding()
        .foregroundColor(.primary)
        
        Spacer()
    }
}
