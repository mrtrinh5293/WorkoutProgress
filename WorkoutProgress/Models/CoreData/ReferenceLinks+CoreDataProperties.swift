//
//  ReferenceLinks+CoreDataProperties.swift
//  WorkoutProgress
//
//  Created by duc on 2022-01-21.
//
//

import Foundation
import CoreData


extension ReferenceLinks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ReferenceLinks> {
        return NSFetchRequest<ReferenceLinks>(entityName: "ReferenceLinks")
    }

    @NSManaged public var bodyPart: String?
    @NSManaged public var createdAt: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var metadata: Data?
    @NSManaged public var updatedAt: Date?
    @NSManaged public var url: String?
    @NSManaged public var exerciseHistory: ExerciseHistory?
    @NSManaged public var exercise: Exercise?

    var wCreatedAt: Date { createdAt ?? Date() }
}

extension ReferenceLinks : Identifiable {

}
