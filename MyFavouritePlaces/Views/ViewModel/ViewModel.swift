//
//  ViewModel.swift
//  MyFavouritePlaces
//
//  Created by Peter on 28/5/2023.
//

import Foundation
import CoreData
import SwiftUI

fileprivate var defaultImage = Image(systemName: "photo")
fileprivate var downloadImage: [URL: Image] = [:]

func saveData() {
    let context = PersistenceHandler.shared.container.viewContext
    do {
        try context.save()
    } catch {
        let error = error as NSError
        fatalError("Error occured while saving: \(error)")
    }
}

func addNewPlace() {
    let context = PersistenceHandler.shared.container.viewContext
    let newPlace = Place(context: context)
    saveData()
}

extension Place {
    
    func addDetail(_ description:String) {
        let context = PersistenceHandler.shared.container.viewContext
        var newDetail = Detail(context: context)
        newDetail.detail = description
        newDetail.place = self
        saveData()
    }
    
    var strName:String {
        get {
            self.name ?? "Name your place"
        }
        set {
            self.name = newValue
        }
    }
        
    var strLongitude: String {
        get {
            String(self.longitude)
        }
        set {
            if let doubleValue = Double(newValue), doubleValue >= -180.0, doubleValue <= 180.0 {
                self.longitude = doubleValue
            } else {
                print("Invalid longitude value \(newValue)")
            }
        }
    }
    
    var strLatitude:String{
        get{
            String(self.latitude)
        }
        set {
            if let doubleValue = Double(newValue), doubleValue >= -90.0, doubleValue <= 90.0 {
                self.longitude = doubleValue
            } else {
                print("Invalid longitude value \(newValue)")
                }
            }
        }
    
    var strUrl: String {
        get {
            self.imagurl?.absoluteString ?? "No Image set"
        }
        set {
            if let url = URL(string: newValue) {
                self.imagurl = url
            } else {
                print("Invalid URL link \(newValue)")
            }
        }
    }
}
    
extension Detail {
    var detailString:String {
        get {
            self.detail ?? "Add a description for your place"
        }
        set {
            self.detail = newValue
        }
    }
}

extension ContentView {
    func delPlace(index: IndexSet) {
        withAnimation {
            index.map{favouritePlaces[$0]}.forEach { place in
                context.delete(place)
            }
            saveData()
        }
    }
}

