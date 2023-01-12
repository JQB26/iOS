//
//  Today.swift
//  HabitTracker
//
//  Created by Jakub Szczepanek on 12/01/2023.
//

import SwiftUI
import CoreData

struct Today: View {
    @FetchRequest(entity: Habit.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Habit.dateAdded, ascending: false)], predicate: nil, animation: .easeInOut) var habits: FetchedResults<Habit>
    
    var body: some View {
        List {
            ForEach(habits) { habit in
                HStack {
                    Text(habit.title ?? "")
                        .font(.callout.bold())
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "square")
                            .tint(.black)
                    }
                }
                .padding(.horizontal)
                .padding(.vertical)
                .background(Color(UIColor().generateColor(rgba: habit.color ?? "0.0 0.0 1.0 0.5")), in: RoundedRectangle(cornerRadius: 6))
            }
        }
    }
}

struct Today_Previews: PreviewProvider {
    static var previews: some View {
        Today()
    }
}
