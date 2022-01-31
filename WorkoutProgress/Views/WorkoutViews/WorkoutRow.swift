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
    @ObservedObject var workout: Workout
    @State private var shouldPresentEditWorkout: Bool = false
    
    var body: some View {
        NavigationLink(destination: ExerciseList()) {
            VStack(alignment: .leading, spacing: 7) {
                HStack {
                    Text(workout.wName)
                        .font(kPrimaryBodyFont)
                        .fontWeight(.bold)
                        .lineLimit(2)
                    
                    if workout.wIsFavourite {
                        Image(systemName: "star.fill")
                            .font(kPrimarySubheadlineFont)
                            .foregroundColor(.yellow)
                    }
                }
                .sheet(isPresented: $shouldPresentEditWorkout) {
                    Text("Add Workout")
                }
                
                if workout.wExercises.count > 0 {
                    HStack {
                        Text("Exercise:")
                        Text("\(workout.wExercises.count)")
                    }
                    .font(kPrimarySubheadlineFont)
                    .foregroundColor(.secondary)
                }
                Spacer()
                // MARK: Start workout View
                //
            }
            .padding([.vertical], 10)
            .contextMenu {
                Button {
                    self.shouldPresentEditWorkout.toggle()
                } label: {
                    Image(systemName: "square.and.pencil")
                    Text("kButtonTitleEdit")
                }
                
                Button {
                    withAnimation {
                        self.toggleFav(workout: workout )
                    }
                } label: {
                    Image(systemName: workout.wIsFavourite ? "star.fill" : "star")
                    Text(workout.wIsFavourite ? "kButtonTitleUnfavourite" : "kButtonTitleFavourite")
                }


            }
        }
    }
    
    /**Toggles favourite status of the workout*/
    func toggleFav(workout: Workout) {
        workout.isFavorite.toggle()
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                print(error)
            }
        }
    }
}

struct WorkoutRow_Previews: PreviewProvider {
    static var previews: some View {
        var wk = Workout()
        WorkoutRow(workout: wk)
    }
}
