//
//  User+CoreDataProperties.swift
//  WorkoutProgress
//
//  Created by duc on 2022-01-21.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var dob: Date?
    @NSManaged public var firstName: String?
    @NSManaged public var gender: String?
    @NSManaged public var height: Double
    @NSManaged public var id: UUID?
    @NSManaged public var lastName: String?
    @NSManaged public var mass: Double

}

extension User : Identifiable {

}
