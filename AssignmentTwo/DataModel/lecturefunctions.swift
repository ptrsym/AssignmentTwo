//
//  lecturefunctions.swift
//  AssignmentTwo
//
//  Created by Peter on 25/5/2023.
//

import Foundation
import CoreData


extension Place {
    var strName:String {
        get {
            self.name ?? "Name your place"
        }
        set {
            self.name = newValue
        }
    }
    var longitude:Double{
        get{
            self.longitude ?? "0.0"
        }
        set{
            if let newValue = Double(newValue), newValue >= -180.0, newValue <= 180.0 {
                self.longitude = newValue
            } else {
                print("Invalid longitude value \(newValue)")
            }
        }
    }
    var latitude:Double{
        get{
            self.latitude ?? "0.0"
        }
        set {
            if let newValue = Double(newValue), newValue >= -90.0, newValue <= 90.0 {
                self.latitude = newValue
            } else {
                print("Invalid latitude value \(newValue)")
            }
        }
    }
}
    
extension Detail {
    var desc:String {
        get {
            self.detail ?? "Add a description for your place"
        }
        set {
            self.detail = newValue
        }
    }
}
    

