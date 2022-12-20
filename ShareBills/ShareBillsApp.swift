//
//  ShareBillsApp.swift
//  ShareBills
//
//  Created by Setthasit Poosawat on 2/12/2564 BE.
//

import SwiftUI

@main
struct ShareBillsApp: App {
    
    let persistenceContainer = PersistenceManager.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceContainer.container.viewContext)
        }
    }
}
