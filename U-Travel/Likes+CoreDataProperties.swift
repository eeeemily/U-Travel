//
//  Likes+CoreDataProperties.swift
//  U-Travel
//
//  Created by Clement Bentum on 4/25/22.
//
//

import Foundation
import CoreData


extension Likes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Likes> {
        return NSFetchRequest<Likes>(entityName: "Likes")
    }

    @NSManaged public var date: Date?
    @NSManaged public var itemid: Int64
    @NSManaged public var userid: Int64
    @NSManaged public var likeditem: Item?
    @NSManaged public var likesuser: User?

}

extension Likes : Identifiable {

}
