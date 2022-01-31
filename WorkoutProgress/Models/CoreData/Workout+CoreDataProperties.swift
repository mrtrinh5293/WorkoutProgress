//
//  Workout+CoreDataProperties.swift
//  WorkoutProgress
//
//  Created by duc on 2022-01-21.
//
//

import Foundation
import CoreData


extension Workout {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Workout> {
        return NSFetchRequest<Workout>(entityName: "Workout")
    }

    @NSManaged public var bodyPart: String?
    @NSManaged public var createdAt: Date?
    @NSManaged public var deletedAt: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var imagePath: String?
    @NSManaged public var isFavorite: Bool
    @NSManaged public var lastTrainedAt: Date?
    @NSManaged public var name: String?
    @NSManaged public var notes: String?
    @NSManaged public var updatedAt: Date?
    @NSManaged public var excercises: NSSet?
    @NSManaged public var histories: WorkoutHistory?
    
    var wName: String { name ?? kDefaultValue }
    var wNotes: String { notes ?? kDefaultValue }
    var wCreatedAt: Date { createdAt ?? Date() }
    var wUpdatedAt: Date { updatedAt ?? Date() }
    var wId: UUID { id ?? UUID() }
    var wLastTrainedAt: Date { lastTrainedAt ?? Date() }
    var wImagePath: String { imagePath ?? kDefaultValue }
    var wDeletedAt: Date { deletedAt ?? Date() }
    var wIsFavourite: Bool { isFavorite }
    var wBodyPart: BodyParts { BodyParts(rawValue: bodyPart ?? kDefaultValue) ?? BodyParts.others }
    var wExercises: [Exercise] {
        let set = excercises as? Set<Exercise> ?? []
        return set.sorted {
            $0.displayOrder < $1.displayOrder
        }
    }
    
    func lastTrainedAtString() -> String {
        if let lastTrainedAt = lastTrainedAt {
            let previousDate = lastTrainedAt
            let now = Date()

            let formatter = DateComponentsFormatter()
            formatter.unitsStyle = .full
            formatter.allowedUnits = [.day, .hour, .minute, .second]
            formatter.maximumUnitCount = 1

            return "\(formatter.string(from: previousDate, to: now) ?? "") ago"
        }
        return ""
    }

}

extension Workout : Identifiable {

}
