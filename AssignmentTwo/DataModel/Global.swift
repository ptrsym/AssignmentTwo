//
//  Global.swift
//  AssignmentTwo
//
//  Created by Peter on 24/5/2023.
//

import Foundation
import CoreData


extension PlaceList {
    func addPlace(){
        let context = PersistenceHandler.shared.container.viewContext
        let newPlace = Place(context: context)
        self.addToPlaces(newPlace)
    }
}

extension Place {
    func addDetail(_ desc:String){
        let context = PersistenceHandler.shared.container.viewContext
        let newDetail = Detail(context: context)
        newDetail.detail = desc
        self.addToDetails(newDetail)
    }
}
