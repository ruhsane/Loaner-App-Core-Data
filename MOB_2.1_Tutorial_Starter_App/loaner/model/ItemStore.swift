//
//  ItemStore.swift
//  loaner
//
//  Created by Ruhsane Sawut on 5/9/19.
//  Copyright © 2019 LinnierGames. All rights reserved.
//

import UIKit
import CoreData

class ItemStore: NSObject {
    let persistentContainer: NSPersistentContainer = {
        // creates the NSPersistentContainer object
        // must be given the name of the Core Data model file "LoanedItems"
        let container = NSPersistentContainer(name: "LoanedItems")
        
        // load the saved database if it exists, creates it if it does not, and return an error under failure conditions
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error setting up Core Data (\(error)).")
            }
        }
        return container
    }()
    
    // Save Core Data Context
    func saveContext() {
        let viewContext = persistentContainer.viewContext
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                // fatalError() causes the application to generate a crash log and terminate.
                // should not use this func in a shipping application, although it may be useful during development
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}
