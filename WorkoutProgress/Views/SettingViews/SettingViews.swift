//
//  SettingViews.swift
//  WorkoutProgress
//
//  Created by duc on 2022-01-14.
//

import SwiftUI

struct SettingViews: View {
    
    @EnvironmentObject var appSettings: AppSettings
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack(spacing: 30) {
                        Text("Name")
                        TextField("Duc Dang", text: $appSettings.userName)
                            .multilineTextAlignment(.trailing)
                    }
                }
            }
        }
    }
}
