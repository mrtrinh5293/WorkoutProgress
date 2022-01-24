//
//  ExerciseSet+CoreDataProperties.swift
//  WorkoutProgress
//
//  Created by duc on 2022-01-21.
//
//

import Foundation
import CoreData


extension ExerciseSet {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ExerciseSet> {
        return NSFetchRequest<ExerciseSet>(entityName: "ExerciseSet")
    }

    @NSManaged public var createdAt: Date?
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
    @NSManaged public var exercise: Exercise?

}

extension ExerciseSet : Identifiable {

}
