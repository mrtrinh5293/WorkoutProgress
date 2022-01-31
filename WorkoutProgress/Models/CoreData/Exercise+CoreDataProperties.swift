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
    @NSManaged public var references: NSSet?
    @NSManaged public var exerciseSets: NSSet?
    
    var wID: UUID { id ?? UUID() }
    var wName: String { name ?? kDefaultValue }
    var wNotes: String { notes ?? kDefaultValue }
    var wCreatedAt: Date { createdAt ?? Date() }
    var wUpdatedAt: Date { updatedAt ?? Date() }
    var wDeletedAt: Date { deletedAt ?? Date() }
    var wExpectedTotalDuration: Int16 { expectedTotalDuration }
    var wActualTotalDuration: Int16 { actualTotalDuration }
    var wExpectedRestDuration: Int16 { expectedRestDuration }
    var wActualRestDuration: Int16 { actualRestDuration }
    var wIsFavourite: Bool { isFavourite }
    var wBodyPart: BodyParts { BodyParts(rawValue: bodyPart ?? kDefaultValue) ?? BodyParts.others }
    var wWorkout: Workout { workout ?? Workout() }
    var wExerciseSets: [ExerciseSet] {
        let set = exerciseSets as? Set<ExerciseSet> ?? []
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

extension Exercise : Identifiable {

}
