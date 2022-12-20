//
//  HistoryView.swift
//  ShareBills
//
//  Created by Setthasit Poosawat on 7/12/2564 BE.
//

import SwiftUI
import CoreData

struct HistoryView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \History.timestamp, ascending: false)])
    private var history:FetchedResults<History>
    
    private let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(history) { histories in
                    NavigationLink("\(histories.bill_name!) on \(histories.timestamp!, formatter: timeFormatter)", destination: HistoryDetailView(historyBill: histories))
                }
                .onDelete(perform: deleteBill)
            }
            .navigationTitle("History")
        }
    }
    
    private func saveContext() {
        do {
            try viewContext.save()
        }
        catch {
            let error = error as NSError
            fatalError("Unresolved Error: \(error)")
        }
    }
    
    private func deleteBill(offsets: IndexSet) {
        withAnimation {
            offsets.map { history[$0] }.forEach(viewContext.delete)
            saveContext()
        }
    }
}
