//
//  AssignmentTwoApp.swift
//  AssignmentTwo
//
//  Created by Peter on 24/5/2023.
//

import SwiftUI

@main
struct AssignmentTwoApp: App {
    
    var model = PersistenceHandler.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, model.container.viewContext)
        }
    }
}
