//
//  WorkoutHistory+CoreDataProperties.swift
//  WorkoutProgress
//
//  Created by duc on 2022-01-21.
//
//

import Foundation
import CoreData


extension WorkoutHistory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WorkoutHistory> {
        return NSFetchRequest<WorkoutHistory>(entityName: "WorkoutHistory")
    }

    @NSManaged public var bodyPart: String?
    @NSManaged public var name: String?
    @NSManaged public var lastTrainedAt: Date?
    @NSManaged public var isFavourite: Bool
    @NSManaged public var imagePath: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var finishedAt: Date?
    @NSManaged public var duration: Int16
    @NSManaged public var deletedAt: Date?
    @NSManaged public var createdAt: Date?
    @NSManaged public var notes: String?
    @NSManaged public var startedAt: Date?
    @NSManaged public var status: Bool
    @NSManaged public var updatedAt: Date?
    @NSManaged public var workout: Workout?
    @NSManaged public var exercises: ExerciseHistory?

}

extension WorkoutHistory : Identifiable {

}
