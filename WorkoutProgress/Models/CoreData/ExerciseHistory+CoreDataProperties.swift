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
    @NSManaged public var references: NSSet?
    @NSManaged public var excerciseSets: NSSet?
    
    var wId: UUID { id ?? UUID() }
    var wName: String { name ?? kDefaultValue }
    var wNotes: String { notes ?? kDefaultValue }
    var wCreatedAt: Date { createdAt ?? Date() }
    var wUpdatedAt: Date { updatedAt ?? Date() }
    var wDeletedAt: Date { deletedAt ?? Date() }
    var wExpectedTotalDuration: Int16 { expectedTotalDuration }
    var wActualTotalDuration: Int16 { actualTotalDuration }
    var wExpectedRestDuration: Int16 { expectedResDuration }
    var wActualRestDuration: Int16 { actualRestDuration }
    var wIsFavourite: Bool { isFavorite }
    var wBodyPart: BodyParts { BodyParts(rawValue: bodyPart ?? kDefaultValue) ?? BodyParts.others }
    var wWorkout: WorkoutHistory { workout ?? WorkoutHistory() }
    var wExerciseSets: [ExerciseSetHistory] {
        let set = excerciseSets as? Set<ExerciseSetHistory> ?? []
        return set.sorted {
            $0.createdAt ?? Date() < $1.createdAt ?? Date()
        }
    }
    var wReferences: [ReferenceLinks] {
        let set = references as? Set<ReferenceLinks> ?? []
        return set.sorted {
            $0.createdAt ?? Date() < $1.createdAt ?? Date()
        }
    }

}

extension ExerciseHistory : Identifiable {

}
