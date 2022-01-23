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
    @NSManaged public var excercises: Exercise?
    @NSManaged public var histories: WorkoutHistory?

}

extension Workout : Identifiable {

}
