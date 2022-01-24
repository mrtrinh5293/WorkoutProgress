//
//  WorkoutRow.swift
//  WorkoutProgress
//
//  Created by duc on 2022-01-21.
//

import SwiftUI
import CoreData

struct WorkoutRow: View {
    
    @EnvironmentObject var appSettings: AppSettings
    @Environment(\.managedObjectContext) var managedObjectContext
//    @ObservedObject var workout: Workout
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct WorkoutRow_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutRow()
    }
}
