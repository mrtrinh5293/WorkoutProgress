//
//  AppSettings.swift
//  WorkoutProgress
//
//  Created by duc on 2022-01-14.
//

import Foundation
import SwiftUI

class AppSettings: ObservableObject {
    //
    
    init() {
        self.selectedTabs = UserDefaults.standard.value(forKey: "selectedTab") as? Int ?? 0
        self.userName = UserDefaults.standard.value(forKey: "userName") as? String ?? "username"
        self.idDBLocationMigrated = UserDefaults.standard.value(forKey: "isDBLocationMigrated") as? Bool ?? false
    }
    
    @Published var selectedTabs: Int {
        // we use either didSet to execute code when a property has just been set, or willSet to execute code before a property has been set.
        didSet {
            UserDefaults.standard.set(selectedTabs, forKey: "selectedTab")
        }
    }
    
    @Published var userName: String {
        didSet {
            UserDefaults.standard.set(userName, forKey: "userName")
        }
    }
    
    var idDBLocationMigrated: Bool {
        didSet {
            UserDefaults.standard.set(idDBLocationMigrated, forKey: "idDBLocationMigrated")
        }
    }
}
