//
//  ViewModel.swift
//  AssignmentTwo
//
//  Created by Peter on 27/5/2023.
//

import Foundation
import CoreData


extension PlaceList {
    private func addPlace(){
        let context = PersistenceHandler.shared.container.viewContext
        let newPlace = Place(context: context)
        self.addToPlaces(newPlace)
    }
}

extension Place {
    private func addDetail(_ desc:String){
        let context = PersistenceHandler.shared.container.viewContext
        let newDetail = Detail(context: context)
        newDetail.detail = desc
        self.addToDetails(newDetail)
    }
}

func saveData() {
    let context = PersistenceHandler.shared.container.viewContext
    do {
        try context.save()
    }catch {
        print("Error saving: \(error)")
    }
}

