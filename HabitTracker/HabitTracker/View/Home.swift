//
//  Home.swift
//  HabitTracker
//
//  Created by Jakub Szczepanek on 10/01/2023.
//

import SwiftUI
import CoreData

struct Home: View {
    
    var body: some View {
        TabView {
            Habits()
                .tabItem {
                    Label("Habits", systemImage: "calendar")
                }
            Habits()
                .tabItem {
                    Label("Today", systemImage: "calendar.day.timeline.left")
                }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
