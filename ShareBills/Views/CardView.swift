//
//  CardView.swift
//  ShareBills
//
//  Created by Setthasit Poosawat on 4/12/2564 BE.
//

import SwiftUI

struct CardView: View {
    
    var cardLabelText = ""
    var totalAmount = 50.55
    var subtotalAmount = 42.48
    var tipAmount = 5.34
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(cardLabelText)
                .foregroundColor(.primary)
                .fontWeight(.black)
            ZStack {
                Rectangle()
                    .foregroundColor(.gray)
                    .cornerRadius(24)
                
                HStack {
                    Spacer()
                    
                    Text("\(totalAmount, specifier: "%.2f") $")
                        .foregroundColor(.white)
                        .font(.system(size: 40, weight: .black, design: .monospaced))
                        .fontWeight(.black)
                    
                    Spacer()
                    
                    Rectangle()
                        .foregroundColor(Color(red: 128/255, green: 128/255, blue: 128/255))
                        .frame(width: 1, height: 70)
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading) {
                            Text("SUBTOTAL")
                                .font(.system(.caption, design: .rounded))
                                .fontWeight(.light)
                            Text("\(subtotalAmount, specifier: "%.2f") $")
                                .font(.system(.body, design: .monospaced))
                                .fontWeight(.black)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("TIP")
                                .font(.system(.caption, design: .rounded))
                                .fontWeight(.light)
                            Text("\(tipAmount, specifier: "%.2f") ฿")
                                .font(.system(.body, design: .monospaced))
                                .fontWeight(.black)
                        }
                    }
                    .foregroundColor(.white)
                    
                    Spacer()
                }
                .padding(5)
            }
        }
    }
}
