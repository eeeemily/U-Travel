//
//  Friends+CoreDataProperties.swift
//  U-Travel
//
//  Created by Clement Bentum on 4/20/22.
//
//

import Foundation
import CoreData


extension Friends {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Friends> {
        return NSFetchRequest<Friends>(entityName: "Friends")
    }

    @NSManaged public var userid: Int64
    @NSManaged public var friendid: Int64
    @NSManaged public var friendship_anniv: Date?
    @NSManaged public var attribute: NSObject?
    @NSManaged public var friendsuser: User?

}

extension Friends : Identifiable {

}
