//
//  MyFavouritePlaces.swift
//  AssignmentTwo
//
//  Created by Peter on 24/5/2023.
//

import SwiftUI

@main
struct MyFavouritePlaces: App {
    let persistenceHandler = PersistenceHandler.shared
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistenceHandler.container.viewContext)
                .environment(\.colorScheme, .dark)
        }
    }
}
