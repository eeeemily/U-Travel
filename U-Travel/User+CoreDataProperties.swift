//
//  User+CoreDataProperties.swift
//  U-Travel
//
//  Created by Clement Bentum on 4/25/22.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var dateofbirth: Date?
    @NSManaged public var email: String?
    @NSManaged public var fname: String?
    @NSManaged public var lname: String?
    @NSManaged public var paymentmethod: String?
    @NSManaged public var phonenum: Int64
    @NSManaged public var picture: URL?
    @NSManaged public var user_id: Int64
    @NSManaged public var userbookings: NSSet?
    @NSManaged public var userfriends: NSSet?
    @NSManaged public var userLikes: NSSet?
    @NSManaged public var userpreferences: NSSet?

}

// MARK: Generated accessors for userbookings
extension User {

    @objc(addUserbookingsObject:)
    @NSManaged public func addToUserbookings(_ value: Bookings)

    @objc(removeUserbookingsObject:)
    @NSManaged public func removeFromUserbookings(_ value: Bookings)

    @objc(addUserbookings:)
    @NSManaged public func addToUserbookings(_ values: NSSet)

    @objc(removeUserbookings:)
    @NSManaged public func removeFromUserbookings(_ values: NSSet)

}

// MARK: Generated accessors for userfriends
extension User {

    @objc(addUserfriendsObject:)
    @NSManaged public func addToUserfriends(_ value: Friends)

    @objc(removeUserfriendsObject:)
    @NSManaged public func removeFromUserfriends(_ value: Friends)

    @objc(addUserfriends:)
    @NSManaged public func addToUserfriends(_ values: NSSet)

    @objc(removeUserfriends:)
    @NSManaged public func removeFromUserfriends(_ values: NSSet)

}

// MARK: Generated accessors for userLikes
extension User {

    @objc(addUserLikesObject:)
    @NSManaged public func addToUserLikes(_ value: Likes)

    @objc(removeUserLikesObject:)
    @NSManaged public func removeFromUserLikes(_ value: Likes)

    @objc(addUserLikes:)
    @NSManaged public func addToUserLikes(_ values: NSSet)

    @objc(removeUserLikes:)
    @NSManaged public func removeFromUserLikes(_ values: NSSet)

}

// MARK: Generated accessors for userpreferences
extension User {

    @objc(addUserpreferencesObject:)
    @NSManaged public func addToUserpreferences(_ value: Preferences)

    @objc(removeUserpreferencesObject:)
    @NSManaged public func removeFromUserpreferences(_ value: Preferences)

    @objc(addUserpreferences:)
    @NSManaged public func addToUserpreferences(_ values: NSSet)

    @objc(removeUserpreferences:)
    @NSManaged public func removeFromUserpreferences(_ values: NSSet)

}

extension User : Identifiable {

}
