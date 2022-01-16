//
//  WorkoutProgressApp.swift
//  WorkoutProgress
//
//  Created by duc on 2022-01-12.
//

import SwiftUI

@main
struct WorkoutProgressApp: App {
//    let persistenceController = PersistenceController.shared
    var appSettings = AppSettings()
    var body: some Scene {
        WindowGroup {
            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext).environmentObject(appSettings)
                .environmentObject(appSettings)
        }
    }
}
