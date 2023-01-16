//
//  HabitTrackerApp.swift
//  HabitTracker
//
//  Created by Jakub Szczepanek on 10/01/2023.
//  Inspired by https://www.youtube.com/watch?v=oSF7fSPGmNo

import SwiftUI
import Qualtrics

@main
struct HabitTrackerApp: App {
    let persistenceController = PersistenceController.shared
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color("Color 3").opacity(0.6))
        UITabBar.appearance().backgroundColor = UIColor(Color("Background darker"))
        
        // TODO: read from env variables
        Qualtrics.shared.initializeProject(brandId: "", projectId: "", extRefId: "", completion: { (myInitializationResult) in print(myInitializationResult);})
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
