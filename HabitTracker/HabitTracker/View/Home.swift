//
//  Home.swift
//  HabitTracker
//
//  Created by Jakub Szczepanek on 10/01/2023.
//

import SwiftUI

struct Home: View {
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
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
            .accentColor(Color("Color"))
            
            Button {
                viewModel.triggerQualtricsPopup(viewController: UIApplication.shared.keyWindow?.rootViewController)
            } label: {
                Image(systemName: "envelope")
                    .frame(width: 45, height: 45)
                    .foregroundColor(.white)
                    .background(Color("Background darker"))
                    .clipShape(Circle())
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            .padding(.trailing, 25)
            .padding(.bottom, 70)
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
