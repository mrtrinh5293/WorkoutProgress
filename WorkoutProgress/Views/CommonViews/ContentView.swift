//
//  ContentView.swift
//  WorkoutProgress
//
//  Created by duc on 2022-01-12.
//

import SwiftUI
import CoreData

struct ContentView: View {

    @EnvironmentObject var appSettings: AppSettings
    var body: some View {
        TabView(selection: $appSettings.selectedTabs) {
            WorkoutFilterView().environmentObject(self.appSettings).tabItem {
                Image(systemName: "flame")
                    .imageScale(.large)
                Text("Workout")
            }.tag(0)
            
            WorkoutHistoryTabView().environmentObject(self.appSettings).tabItem {
                Image(systemName: "clock")
                    .imageScale(.large)
                Text("History")
            }.tag(1)
            
            SettingViews().environmentObject(self.appSettings).tabItem {
                Image(systemName: "gear")
                    .imageScale(.large)
                Text("Settings")
            }.tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
