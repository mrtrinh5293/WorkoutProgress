//
//  ExcerciseRow.swift
//  WorkoutProgress
//
//  Created by duc on 2022-02-14.
//

import SwiftUI

struct ExerciseRow: View {
    @EnvironmentObject var appSettings: AppSettings
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @ObservedObject var exercise: Exercise
    @ObservedObject var selectedWorkout: Workout
    
    @State private var shouldPresentEditExercise: Bool = false
    
    @State private var shouldPresentReferences = false
    @State private var referenceViewIndex: Int = kCommonListIndex
    
    var body: some View {
        NavigationLink(destination: ExerciseSetsList(selectedExercise: exercise)) {
            VStack(alignment: .leading) {
                HStack {
                    Text(exercise.wName)
                        .font(kPrimaryBodyFont)
                        .fontWeight(.bold)
                        .padding([.top, .bottom], 10)
                    
                // TODO: Add Exercise VIew

                    if (exercise.wExerciseSets.count > 0) {
                        Spacer()
                        Text("\(exercise.wExerciseSets.count)")
                            .modifier(CustomInfoTextStyle(appSettings: appSettings))
                    }
                }
                
                // Adding empty view to show the sheet as sheet is not presenting if we try to show it anywhere else in the view.
                EmptyView()
                    .frame(width: 0, height: 0, alignment: .center)
                // TODO: Add Ex refence View

            }
            .padding([.top, .bottom], 5)
            .contextMenu {
                Button(action: {
                    self.shouldPresentReferences = true
                }) {
                    Image(systemName: "info.circle.fill")
                    Text("kButtonTitleReferences")
                }
                Button(action: {
                    self.shouldPresentEditExercise = true
                }) {
                    Image(systemName: "square.and.pencil")
                    Text("kButtonTitleEdit")
                }
        }
        }
    }
}
