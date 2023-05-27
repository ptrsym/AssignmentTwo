//
//  DetailView.swift
//  AssignmentTwo
//
//  Created by Peter on 25/5/2023.
//

import SwiftUI
import CoreData

struct DetailView: View {
    @Environment(\.editMode) var isEditMode
    @Environment(\.managedObjectContext) var context
    var place: Place(Context: context)
    @State var isAddingDetail = false
    @State var newDetail = ""
    @State var name = ""
    @State var url = ""
    @State var longitude = ""
    @State var latitude = ""
    
    var body: some View {
        NavigationView {
            VStack {
                if isEditMode?.wrappedValue == .active {
                    Form {
                        Section {
                            TextField("Enter place name", text: $name)
                            TextField("Enter a valid image url", text: $url)
                        }
                        
                        Section {
                            HStack {
                                Button(action: {
                                    isAddingDetail = true
                                }) {
                                    Text("+ New detail")
                                }
                                
                                //Save the new detail based on user input
                                Button(action: {
                                    place.addDetail(newDetail)
                                    saveData()
                                    newDetail = ""
                                    isAddingDetail = false
                                }) {
                                    Text("Save entry")
                                }
                            }
                        }
                        
                        Section(header: Text("Details")) {
                            //provide a textfield when the user wants to add a detail
                            if isAddingDetail {
                                TextField("Enter a location detail", text: $newDetail)
                            }
                            ForEach(place.details) { detail in
                                Text(detail.detail)
                                    .listRowInsets(EdgeInsets())
                            }
                            .onDelete { indexSet in
                                place.details.remove(atOffsets: indexSet)
                                saveData()
                            }
                        }
                        
                        Section {
                            HStack {
                                Text("Longitude: ")
                                TextField("Enter location longitude", text: $longitude)
                            }
                            HStack {
                                Text("Latitude: ")
                                TextField("Enter location latitude", text: $latitude)
                            }
                        }
                        
                        Button(action: {
                            place.strName = name
                            place.strUrl = url
                            place.longitude = longitude
                            place.latitude = latitude
                            saveData()
                            
                            name = ""
                            url = ""
                            longitude = ""
                            latitude = ""
                        }) {
                            Text("Save")
                        }
                    }} else {
                        Form{
                            Section {
                                Text("Name: \(place.strName)")
                                // display image url here
                            }
                            Section(header: Text("Details")) {
                                ForEach(place.details) { detail in
                                    Text(detail.detail)
                                        .listRowInsets(EdgeInsets())
                                }
                                .onDelete { indexSet in
                                    place.details.remove(atOffsets: indexSet)
                                    saveData()
                                }
                            }
                            
                            Section {
                                Text("Longitude: \(place.longitude)")
                                Text("Latitude: \(place.latitude)")
                            }
                        }
                    }
            }
        }
        .navigationBarTitle("\(place.strName)")
        .navigationBarItems(trailing: EditButton())
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
