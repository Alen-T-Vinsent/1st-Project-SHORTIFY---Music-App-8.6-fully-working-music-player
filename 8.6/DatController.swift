//
//  DatController.swift
//  8.6
//
//  Created by Apple  on 10/11/22.
//

import Foundation
import CoreData

class DataController:ObservableObject{
    let container = NSPersistentContainer(name: "8.6 datamodel")
    
    
    init(){
        container.loadPersistentStores { description, error in
            if let error = error{
                print("core data failed to load --------- : \(error.localizedDescription ) ")
            }
        }
    }
    
    
}
