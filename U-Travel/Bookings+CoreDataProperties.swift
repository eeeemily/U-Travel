//
//  Bookings+CoreDataProperties.swift
//  U-Travel
//
//  Created by Clement Bentum on 4/25/22.
//
//

import Foundation
import CoreData


extension Bookings {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Bookings> {
        return NSFetchRequest<Bookings>(entityName: "Bookings")
    }

    @NSManaged public var bookingid: Int64
    @NSManaged public var datebooked: Date?
    @NSManaged public var itemid: Int64
    @NSManaged public var userid: Int64
    @NSManaged public var bookeditem: Item?
    @NSManaged public var bookingsuser: User?

}

extension Bookings : Identifiable {

}
