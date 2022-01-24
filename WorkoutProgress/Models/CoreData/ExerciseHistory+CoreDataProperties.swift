//
//  ExerciseHistory+CoreDataProperties.swift
//  WorkoutProgress
//
//  Created by duc on 2022-01-21.
//
//

import Foundation
import CoreData


extension ExerciseHistory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ExerciseHistory> {
        return NSFetchRequest<ExerciseHistory>(entityName: "ExerciseHistory")
    }

    @NSManaged public var actualRestDuration: Int16
    @NSManaged public var actualTotalDuration: Int16
    @NSManaged public var bodyPart: String?
    @NSManaged public var createdAt: Date?
    @NSManaged public var deletedAt: Date?
    @NSManaged public var expectedResDuration: Int16
    @NSManaged public var expectedTotalDuration: Int16
    @NSManaged public var id: UUID?
    @NSManaged public var isFavorite: Bool
    @NSManaged public var name: String?
    @NSManaged public var notes: String?
    @NSManaged public var updatedAt: Date?
    @NSManaged public var workout: WorkoutHistory?
    @NSManaged public var references: ReferenceLinks?
    @NSManaged public var excerciseSets: ExerciseSetHistory?

}

extension ExerciseHistory : Identifiable {

}
