//
//  HabitTrackerApp.swift
//  HabitTracker
//
//  Created by Jakub Szczepanek on 10/01/2023.
//  Inspired by https://www.youtube.com/watch?v=oSF7fSPGmNo

import SwiftUI
import Qualtrics
import SwiftUI
import FirebaseCore

@main
struct HabitTrackerApp: App {
    let persistenceController = PersistenceController.shared
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color("Color 3").opacity(0.6))
        UITabBar.appearance().backgroundColor = UIColor(Color("Background darker"))
        
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color("Color"))]
        
        // TODO: fill before the run
        Qualtrics.shared.initializeProject(brandId: "", projectId: "", extRefId: "", completion: { (myInitializationResult) in print(myInitializationResult);})
     
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
