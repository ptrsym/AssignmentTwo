//
//  DetailView.swift
//  AssignmentTwo
//
//  Created by Peter on 25/5/2023.
//

import SwiftUI

struct DetailView: View {
    
    @Environment(\.editMode) var isEditMode
    @Environment(\.managedObjectContext) var context
    var place: Place(Context: context)
    @State var isAddingDetail = false
    
    var body: some View {
        VStack{
            if isEditMode == .isActive{
                TextField("Enter place name", text: $place.name)
            } else {
                Text(place.name)
            }
            if place.image.isEmpty == true, isEditMode != .isActive{
                Text("No image set")
            }
            if isEditMode == .isActive{
                TextField("Enter a valid image url", text: $place.image)
            } else{
                // code for rendering image here
            }
            //List details here
            if isEditMode == .isActive{
                Button(action: {
                    
                    addDetail()
                    
                }) {Text("+ Add new detail")}
            }
            List{
                ForEach((place.details){ detail in
                    Text(detail.detail)
                }
            }
            if isEditMode == .isActive{
                HStack{
                    Text("Longitude: ")
                    TextField("Enter location longitude", text $place.longitude)
                }
                HStack{
                    Text("Latitude: ")
                    TextField("Enter location latitude", text: $place.latitude)
                }} else{
                    Text("Longitude: \(place.longitude)")
                    Text("Latitude: \(place.latitude)")
                }
            if isEditMode == .isActive {
                Button(action: {saveData()}) {Text("Save")}
            }
                
            }

//          Longitude
//            Latitude
            }
            
        }
        
    }.nav
        .navigationBarItems(
        trailing: EditButton()
    )
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
