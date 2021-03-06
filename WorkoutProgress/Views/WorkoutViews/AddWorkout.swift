//
//  AddWorkout.swift
//  WorkoutProgress
//
//  Created by duc on 2022-01-24.
//

import SwiftUI
import CoreData

struct AddWorkout: View {
    
    @EnvironmentObject var appSettings: AppSettings
    @Binding var shouldPresentAddNewWorkout: Bool
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @State var name: String = ""
    @State var notes: String = ""
    @State var bodyPartIndex = 0
    var workoutToEdit: Workout?
    
    @State private var errorMessage = ""
    @State private var shouldShowValidationAlert = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("kHeaderName")) {
                    TextField("kPlaceholderEnterHere", text: $name)
                }
                
                Section(header: Text("kHeaderNotes")) { TextField("kPlaceholderEnterHereOptional", text: $notes)
                }
                
                Section(header: Text("kHeaderChooseBodyPart")) {
                    Picker("kPlaceholderBodyPart", selection: $bodyPartIndex) {
                        ForEach(0..<BodyParts.allCases.count, id: \.self) { index in
                            Text(BodyParts.allCases[index].rawValue)
                        }
                        
                    }
                }
            }
            .onAppear {
                kAppDelegate.addSeparatorLineAppearance()
            }
            .navigationBarTitle(Text(workoutToEdit == nil ? "kScreenTitleNewWorkout" : "kScreenTitleEditWorkout"), displayMode: .inline)
            .navigationBarItems(
                trailing: Button(action: { self.validateData() }) { CustomBarButton(title: NSLocalizedString("kButtonTitleSave", comment: "Button title")).environmentObject(appSettings)
            })
        }
    }
    
    func dismissView() {
        self.shouldPresentAddNewWorkout = false
    }
    
    func validateData() {
        name = name.trimmingCharacters(in: .whitespacesAndNewlines)
        notes = notes.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if name.isEmpty {
            errorMessage = NSLocalizedString("kAlertMsgWorkoutNameRequired", comment: "Alert message")
            shouldShowValidationAlert.toggle()
        } else {
            saveWorkout()
        }
    }
    
    func saveWorkout() {
        if workoutToEdit != nil { // Update workout flow
            workoutToEdit?.name = self.name
            workoutToEdit?.notes = self.notes
            workoutToEdit?.bodyPart = BodyParts.allCases[bodyPartIndex].rawValue
        } else { // New workout flow
            let newWorkout = Workout(context: managedObjectContext)
            newWorkout.name = self.name
            newWorkout.notes = self.notes
            newWorkout.bodyPart = BodyParts.allCases[bodyPartIndex].rawValue
            newWorkout.id = UUID()
            newWorkout.createdAt = Date()
            newWorkout.updatedAt = Date()
            newWorkout.isFavorite = false
        }
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
                dismissView()
            } catch {
                print(error)
            }
        }
    }
}

struct AddWorkout_Previews: PreviewProvider {
    static var previews: some View {
        
        AddWorkout(shouldPresentAddNewWorkout: .constant(false))
    }
}
