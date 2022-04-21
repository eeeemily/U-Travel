//
//  Item+CoreDataProperties.swift
//  U-Travel
//
//  Created by Clement Bentum on 4/20/22.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var itemid: Int64
    @NSManaged public var catergory: String?
    @NSManaged public var picture: URL?
    @NSManaged public var info: String?
    @NSManaged public var cost: NSDecimalNumber?
    @NSManaged public var company: String?
    @NSManaged public var itemliked: NSSet?
    @NSManaged public var itembooked: NSSet?

}

// MARK: Generated accessors for itemliked
extension Item {

    @objc(addItemlikedObject:)
    @NSManaged public func addToItemliked(_ value: Likes)

    @objc(removeItemlikedObject:)
    @NSManaged public func removeFromItemliked(_ value: Likes)

    @objc(addItemliked:)
    @NSManaged public func addToItemliked(_ values: NSSet)

    @objc(removeItemliked:)
    @NSManaged public func removeFromItemliked(_ values: NSSet)

}

// MARK: Generated accessors for itembooked
extension Item {

    @objc(addItembookedObject:)
    @NSManaged public func addToItembooked(_ value: Bookings)

    @objc(removeItembookedObject:)
    @NSManaged public func removeFromItembooked(_ value: Bookings)

    @objc(addItembooked:)
    @NSManaged public func addToItembooked(_ values: NSSet)

    @objc(removeItembooked:)
    @NSManaged public func removeFromItembooked(_ values: NSSet)

}

extension Item : Identifiable {

}
