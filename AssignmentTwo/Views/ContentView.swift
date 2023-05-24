//
//  ContentView.swift
//  AssignmentTwo
//
//  Created by Peter on 24/5/2023.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var context
    @FetchRequest(entity: /object type here/,sortDescriptors: [], animation: .default)
    var // object to be operated on: FetchedResults<object type here>
    
    var body: some View {
        VStack {

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
