//
//  ContentView.swift
//  AssignmentTwo
//
//  Created by Peter on 24/5/2023.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var context
    @FetchRequest(entity: PlaceList,sortDescriptors: [], animation: .default)
    var favouritePlaces: FetchedResults<PlaceList>
    
    var body: some View {
        NavigationView{
            VStack {
                List{
                    ForEach(favouritePlaces[0].places) { place in
                        NavigationLink(destination: DetailView(place)){
                            PlaceRowView(place)
                        }
                    }.onDelete {indexSet in
                        favouritePlaces[0].places.remove(atOffsets: indexSet)
                        saveData()
                   
                }
                }
                
            }
            .padding()
        }.navigationTitle("Favourite Places")
            .navigationBarItems(
                leading: Button(action:{favouritePlaces[0].placelist.addPlace()}) {Text("New Place")}
            ,
                trailing: EditButton())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
