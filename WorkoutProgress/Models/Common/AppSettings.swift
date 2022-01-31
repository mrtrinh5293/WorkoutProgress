//
//  AppSettings.swift
//  WorkoutProgress
//
//  Created by duc on 2022-01-14.
//

import Foundation
import SwiftUI

enum AppThemeColours: String, CaseIterable {
    case green = "systemGreen"
    case red = "systemRed"
    case orange = "systemOrange"
    case blue = "systemBlue"
    case yellow = "systemYellow"
    case indigo = "systemIndigo"
    
    func uiColor() -> UIColor {
        switch self {
        case .green: return UIColor.systemGreen
        case .red: return UIColor.systemRed
        case .orange: return UIColor.systemOrange
        case .blue: return UIColor.systemBlue
        case .yellow: return UIColor.systemYellow
        case .indigo: return UIColor.systemIndigo
        }
    }
}

class AppSettings: ObservableObject {
    //
    
    
    init() {
        self.themeColorIndex = UserDefaults.standard.value(forKey: "themeColorIndex") as? Int ?? 0
        self.selectedTabs = UserDefaults.standard.value(forKey: "selectedTab") as? Int ?? 0
        self.userName = UserDefaults.standard.value(forKey: "userName") as? String ?? "username"
        self.idDBLocationMigrated = UserDefaults.standard.value(forKey: "isDBLocationMigrated") as? Bool ?? false
        self.isDBLocationMigrated = UserDefaults.standard.value(forKey: "isDBLocationMigrated") as? Bool ?? false
    }
    
    @Published var themeColorIndex: Int {
        didSet {
            UserDefaults.standard.set(themeColorIndex, forKey: "themeColorIndex")
            kAppDelegate.configureAppearances(color: AppThemeColours.allCases[themeColorIndex].uiColor())
        }
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
    
    var isDBLocationMigrated: Bool {
        didSet {
            UserDefaults.standard.set(isDBLocationMigrated, forKey: "isDBLocationMigrated")
        }
    }
    
    func themeColorView() -> Color { Color(AppThemeColours.allCases[1].uiColor()) }
}
