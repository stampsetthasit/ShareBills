//
//  Persistence.swift
//  ShareBills
//
//  Created by Setthasit Poosawat on 6/12/2564 BE.
//

import Foundation
import CoreData

struct PersistenceManager {
    static let shared = PersistenceManager()
    
    let container:NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "ShareBill")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unresolved error: \(error)")
            }
        }
    }
}

