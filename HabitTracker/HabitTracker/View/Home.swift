//
//  Home.swift
//  HabitTracker
//
//  Created by Jakub Szczepanek on 10/01/2023.
//

import SwiftUI

struct Home: View {
    
    var body: some View {
        TabView {
            Today()
                .tabItem {
                    Label("Today", systemImage: "calendar.day.timeline.left")
                }
            Habits()
                .tabItem {
                    Label("Habits", systemImage: "calendar")
                }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
