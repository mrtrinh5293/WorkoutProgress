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
    
    var wId: UUID { id ?? UUID() }
    var wName: String { name ?? kDefaultValue }
    var wNotes: String { notes ?? kDefaultValue }
    var wCreatedAt: Date { createdAt ?? Date() }
    var wUpdatedAt: Date { updatedAt ?? Date() }
    var wDeletedAt: Date { deletedAt ?? Date() }
    var wWeight: Double { weight }
    var wReputation: Int16 { reputation }
    var wStatus: Bool { status }
    var wDuration: Int16 { duration }
    var wIsFavourite: Bool { isFavourite }
    var wExercise: ExerciseHistory { exercise ?? ExerciseHistory() }

}

extension ExerciseSetHistory : Identifiable {

}
