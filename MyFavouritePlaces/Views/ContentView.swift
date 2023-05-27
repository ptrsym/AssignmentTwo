//
//  ContentView.swift
//  AssignmentTwo
//
//  Created by Peter on 24/5/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var context
    @FetchRequest(sortDescriptors: [], animation: .default) var favouritePlaces: FetchedResults<Place>
    
    var body: some View {
        NavigationView{
            VStack {
                List{
                    ForEach(favouritePlaces, id:\.self) { place in
                        NavigationLink(destination: DetailView(place: place)){
                            PlaceRowView(place: place)
                        }
                    }.onDelete(perform: delPlace)
                }
                
            }
            .padding()
        }.navigationTitle("My Favourite Places")
            .navigationBarItems(
                leading: Button(action:{
                    favouritePlaces.addNewPlace
                    saveData()
                }) {Text("New Place")}
            ,
                trailing: EditButton())
    }
}
