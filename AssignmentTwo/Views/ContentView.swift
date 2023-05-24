//
//  ContentView.swift
//  AssignmentTwo
//
//  Created by Peter on 24/5/2023.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var context
    @FetchRequest(entity: Place,sortDescriptors: [], animation: .default)
    var favouritePlaces: FetchedResults<Place>
    
    var body: some View {
        NavigationView{
            VStack {
                List{
                    ForEach(favouritePlaces) {
                        place in
                        PlaceRowView(place)
                    }
                   
                }
                
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
