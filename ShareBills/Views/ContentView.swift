//
//  ContentView.swift
//  ShareBills
//
//  Created by Setthasit Poosawat on 2/12/2564 BE.
//

import SwiftUI

struct TitleView: View {
    var title:String
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.primary)
                .fontWeight(.black)
            Spacer()
        }
    }
}

struct ContentView: View {
    @State var numberOfPeople:Int = 0
    
    var body: some View {
        TabView {
            ShareBillView()
                .tabItem {
                    Image(systemName: "dollarsign.circle")
                    Text("ShareBill")
                }
            HistoryView()
                .tabItem {
                    Image(systemName: "clock.arrow.circlepath")
                    Text("History")
                }
        }
        .accentColor(.primary)
    }
}
