//
//  Exercise+CoreDataProperties.swift
//  WorkoutProgress
//
//  Created by duc on 2022-01-21.
//
//

import Foundation
import CoreData


extension Exercise {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Exercise> {
        return NSFetchRequest<Exercise>(entityName: "Exercise")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var actualRestDuration: Int16
    @NSManaged public var actualTotalDuration: Int16
    @NSManaged public var bodyPart: String?
    @NSManaged public var createdAt: Date?
    @NSManaged public var deletedAt: Date?
    @NSManaged public var displayOrder: Int16
    @NSManaged public var expectedRestDuration: Int16
    @NSManaged public var expectedTotalDuration: Int16
    @NSManaged public var isFavourite: Bool
    @NSManaged public var name: String?
    @NSManaged public var notes: String?
    @NSManaged public var updatedAt: Date?
    @NSManaged public var workout: Workout?
    @NSManaged public var references: ReferenceLinks?
    @NSManaged public var exerciseSets: ExerciseSet?

}

extension Exercise : Identifiable {

}
