//
//  WorkoutFilterView.swift
//  WorkoutProgress
//
//  Created by duc on 2022-01-14.
//

import SwiftUI

struct WorkoutFilterView: View {
    
    @EnvironmentObject var appSettings: AppSettings
    @Environment(\.managedObjectContext) var managedObjectContext
    @State private var onlyFavourite = false
    @State private var shouldPresentAddNewWorkout: Bool = false
    
    var body: some View {
        NavigationView {
            WorkoutsList(predicate: self.customPredicate(), sortDescriptor: NSSortDescriptor(keyPath: \Workout.createdAt, ascending: true)).environmentObject(appSettings)
                .navigationTitle(Text("kScreenTitleWorkouts"))
                .navigationBarItems(leading:
                    Button {
                    
                    } label: {
                        Image(systemName: "star.fill")
                    }, trailing:
                    Button {
                        self.shouldPresentAddNewWorkout.toggle()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(kPrimaryTitleFont)
                            .foregroundColor(appSettings.themeColorView())
                    }.sheet(isPresented: $shouldPresentAddNewWorkout) {
                        AddWorkout(shouldPresentAddNewWorkout: self.$shouldPresentAddNewWorkout)
                            .environment(\.managedObjectContext, self.managedObjectContext).environmentObject(self.appSettings)
                    }
                )
            
            
            
        }
    }
    
    /**Creates predicate based on filter values*/
    func customPredicate() -> NSPredicate? {
        if onlyFavourite {
            let predicate = NSPredicate(format: "isFavourite == %@", NSNumber(booleanLiteral: onlyFavourite))
            return predicate
        } else {
            return nil
        }
    }
}
