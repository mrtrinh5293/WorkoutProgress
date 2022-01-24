//
//  ExerciseSetHistory+CoreDataProperties.swift
//  WorkoutProgress
//
//  Created by duc on 2022-01-21.
//
//

import Foundation
import CoreData


extension ExerciseSetHistory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ExerciseSetHistory> {
        return NSFetchRequest<ExerciseSetHistory>(entityName: "ExerciseSetHistory")
    }

    @NSManaged public var deletedAt: Date?
    @NSManaged public var duration: Int16
    @NSManaged public var id: UUID?
    @NSManaged public var isFavourite: Bool
    @NSManaged public var name: String?
    @NSManaged public var notes: String?
    @NSManaged public var reputation: Int16
    @NSManaged public var status: Bool
    @NSManaged public var updatedAt: Date?
    @NSManaged public var weight: Double
    @NSManaged public var createdAt: Date?
    @NSManaged public var exercise: ExerciseHistory?

}

extension ExerciseSetHistory : Identifiable {

}
