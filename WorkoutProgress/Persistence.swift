////
////  Persistence.swift
////  WorkoutProgress
////
////  Created by duc on 2022-01-12.
//
//
//import CoreData
//
//struct PersistenceController {
//    static let shared = PersistenceController()
//
//    static var preview: PersistenceController = {
//        let result = PersistenceController(inMemory: true)
//        let viewContext = result.container.viewContext
//
//        return result
//    }()
//
//    let container: NSPersistentContainer
//
//    init(inMemory: Bool = false) {
//        container = NSPersistentContainer(name: "WorkoutProgress")
//        let newStoreURL = AppGroup.group.containerURL.appendingPathComponent("WorkoutProgress.sqlite")
//        let description = NSPersistentStoreDescription(url: newStoreURL)
//        container.persistentStoreDescriptions = [description]
//        
//        if inMemory {
//            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
//        }
//        
////        container.viewContext.automaticallyMergesChangesFromParent = true
//        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//            if let error = error as NSError? {
//
//                fatalError("Unresolved error \(error), \(error.userInfo)")
//            }
//        })
//    }
//}
