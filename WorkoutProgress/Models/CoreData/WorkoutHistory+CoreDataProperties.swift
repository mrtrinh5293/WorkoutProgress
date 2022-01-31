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
    @NSManaged public var imagePath: String?
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
    @NSManaged public var exercises: NSSet?
    
    var wName: String { name ?? kDefaultValue }
    var wNotes: String { notes ?? kDefaultValue }
    var wCreatedAt: Date { createdAt ?? Date() }
    var wUpdatedAt: Date { updatedAt ?? Date() }
    var wStartedAt: Date { startedAt ?? Date() }
    var wFinishedAt: Date { finishedAt ?? Date() }
    var wId: UUID { id ?? UUID() }
    var wLastTrainedAt: Date { lastTrainedAt ?? Date() }
    var wImagePath: String { imagePath ?? kDefaultValue }
    var wDeletedAt: Date { deletedAt ?? Date() }
    var wIsFavourite: Bool { isFavourite }
    var wBodyPart: BodyParts { BodyParts(rawValue: bodyPart ?? kDefaultValue) ?? BodyParts.others }
    var wExercises: [ExerciseHistory] {
        let set = exercises as? Set<ExerciseHistory> ?? []
        return set.sorted {
            $0.createdAt ?? Date() < $1.createdAt ?? Date()
        }
    }
    var wDuration: Int16 { duration }
    var wStatus: Bool { status }
    var wWorkout: Workout { workout ?? Workout() }
    
    /**Check whether all sets are completed*/
    func isAllSetCompleted() -> Bool {
        for exercise in wExercises {
            for sets in exercise.wExerciseSets {
                if sets.wStatus == false {
                    return false
                }
            }
        }
        return true
    }

}

extension WorkoutHistory : Identifiable {

}
