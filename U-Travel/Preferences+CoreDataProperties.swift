//
//  Preferences+CoreDataProperties.swift
//  U-Travel
//
//  Created by Clement Bentum on 4/20/22.
//
//

import Foundation
import CoreData


extension Preferences {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Preferences> {
        return NSFetchRequest<Preferences>(entityName: "Preferences")
    }

    @NSManaged public var user_id: Int64
    @NSManaged public var datesubmitted: Date?
    @NSManaged public var weather: NSDecimalNumber?
    @NSManaged public var favorite_dest: String?
    @NSManaged public var budget: Double
    @NSManaged public var travel_startday: Date?
    @NSManaged public var travel_endday: Date?
    @NSManaged public var fav_activity: String?
    @NSManaged public var fav_activity2: String?
    @NSManaged public var fav_activity3: String?
    @NSManaged public var fav_activity4: String?
    @NSManaged public var fav_activity5: String?
    @NSManaged public var preferencesusers: User?

}

extension Preferences : Identifiable {

}
