//
//  Persistence.swift
//  AssignmentTwo
//
//  Created by Peter on 24/5/2023.
//


import Foundation
import CoreData

struct PersistenceHandler {
    static let shared = PersistenceHandler()
    let container: NSPersistentContainer
    
    init (){
        container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores {_, error in
            if let err = error {
                fatalError("Error to load with \(err)")
            }
        }
    }
}

