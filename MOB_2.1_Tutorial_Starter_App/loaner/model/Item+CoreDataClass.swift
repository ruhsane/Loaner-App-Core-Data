//
//  Item+CoreDataClass.swift
//  loaner
//
//  Created by Ruhsane Sawut on 5/9/19.
//  Copyright © 2019 LinnierGames. All rights reserved.
//
//

import Foundation
import UIKit.UIImage
import CoreData

@objc(Item)
public class Item: NSManagedObject {
    
    // Initialize our item attributes with default values
    override public func awakeFromInsert() {
        super.awakeFromInsert()
        
        // Give properties initial values
        itemTitle = "Untitled Item"
        notes = ""
        itemImage = UIImage(named: "no item image")!
        loanee = Loanee(name: "", contactNumber: "")
    }
    
    func assignLoanee(name: String?, phoneNumber: String?) {
        
        //validate contact has at least one number
        guard let contactNumber = phoneNumber else {
            return print("this contact needed to have at least one number")
        }
        
        if let contactName = name {
            
            //update loanee var
            let newLoanee = Loanee(
                name: contactName,
                contactNumber: contactNumber
            )
            loanee = newLoanee
        } else {
            loanee = Loanee.init(name: "no name", contactNumber: "no contact number")
        }
    }
    
}
