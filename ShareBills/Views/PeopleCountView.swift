//
//  GuestCountView.swift
//  ShareBills
//
//  Created by Setthasit Poosawat on 4/12/2564 BE.
//

import SwiftUI

struct PeopleCountView: View {
    @Binding var personCount: Int
    
    var body: some View {
        HStack(spacing: 20) {
            Button {
                if personCount > 1 {
                    personCount -= 1
                }
            } label: {
                Image(systemName: "minus.circle")
                    .foregroundColor(.primary)
                    .font(.system(.title, design: .rounded))
            }
            
            Text("\(personCount)")
                .foregroundColor(.primary)
                .font(.system(size: 40, weight: .black, design: .monospaced))
            
            Button {
                personCount += 1
            } label: {
                Image(systemName: "plus.circle")
                    .foregroundColor(.primary)
                    .font(.system(.title, design: .rounded))
            }
        }
    }
}
