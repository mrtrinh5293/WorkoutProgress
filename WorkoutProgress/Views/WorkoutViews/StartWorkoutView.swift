//
//  StartWorkoutView.swift
//  WorkoutProgress
//
//  Created by duc on 2022-01-31.
//

import SwiftUI
import CoreData

struct StartWorkoutView: View {
    
    @EnvironmentObject var appSettings: AppSettings
    @Environment(\.managedObjectContext) var managedObjectContext
    @ObservedObject var workout: Workout
    
    @State private var shouldSHowStartWorkoutAlert = false
    @State private var startButtonSelected: Bool = false
    @State private var todayWorkout = WorkoutHistory(context: kAppDelegate.persistentContainer.viewContext)
    
    var body: some View {
        VStack(spacing: 5) {
            Button {
                self.shouldSHowStartWorkoutAlert.toggle()
            } label: {
                Text("kButtonReadyToStart")
                    .font(kPrimarySubheadlineFont)
                    .foregroundColor(Color(AppThemeColours.green.uiColor()))
                    .bold()
                    .padding(10)
                    .frame(height: 30)
                    .background(Color(AppThemeColours.green.uiColor()).opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            }
            .buttonStyle(BorderlessButtonStyle())
            
            if workout.lastTrainedAt != nil {
                Text("\(workout.lastTrainedAtString())")
                    .font(kPrimaryFootnoteFont)
                    .foregroundColor(.secondary)
            }
        }
        .alert(isPresented: $shouldSHowStartWorkoutAlert) { () -> Alert in
            Alert(title: Text("kButtonReadyToStart"), message: self.alertMessageView(), primaryButton:
                        .cancel(Text("kButtonTitleCancel")), secondaryButton: .default(Text("kButtonTitleStart"), action: {
                //                self.todayWorkout = self.createWorkoutHistory()
                self.startButtonSelected.toggle()
            }))
        }
        .sheet(isPresented: $startButtonSelected) {
            TodayWorkout()
                .environment(\.managedObjectContext, self.managedObjectContext)
                .environmentObject(self.appSettings)
        }
    }
    func alertMessageView() -> Text? {
        var message: String = ""
        
        if !workout.wNotes.isEmpty && workout.wNotes != kDefaultValue {
            message = "\(workout.wNotes)"
        }
        
        let req: NSFetchRequest<WorkoutHistory> = WorkoutHistory.fetchRequest()
        let predicate = NSPredicate(format: "workout.id == %@", workout.wId as CVarArg)
        let sortDescriptor = NSSortDescriptor(keyPath: \WorkoutHistory.createdAt, ascending: false)
        
        req.predicate = predicate
        req.sortDescriptors = [sortDescriptor]
        
        do {
            if let lastWorkoutSession = try managedObjectContext.fetch(req).first, lastWorkoutSession.wDuration > 0 {
                let duration = lastWorkoutSession.wDuration.detailedDisplayDuration()
                if !message.isEmpty { message.append("\n") }
                message.append("\nLast session: \(duration)")
                
                let eta = Date().addingTimeInterval(TimeInterval(lastWorkoutSession.wDuration))
                let formatter = DateFormatter()
                formatter.timeStyle = .short
                
                let timeString = formatter.string(from: eta)
                message.append("\n\nYou might finish the workout at \(timeString)")
            }
        } catch {
            print(error.localizedDescription)
        }
        return !message.isEmpty ? Text(message) : nil
    }
    
    //    func createWorkoutHistory() -> WorkoutHistory {
    //        let workoutHistory = WorkoutHistory(context: managedObjectContext)
    //
    //        workoutHistory.workout = workout
    //
    //        return workout
    //    }
}

struct StartWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        let wk = Workout()
        StartWorkoutView(workout: wk)
    }
}
