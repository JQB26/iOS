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
        VStack {
            Text("Habit Tracker")
                .font(.title.bold())
                .frame(maxWidth: .infinity)
        
            let calendar = Calendar.current
            let todayWeekday = calendar.dateComponents([.weekday], from: Date()).weekday
            let todayWeekdaySymbol = calendar.weekdaySymbols[todayWeekday! - 1]
            let todayHabits = habits.filter { $0.weekDays?.contains(todayWeekdaySymbol) ?? false }
            
            ForEach(todayHabits) { habit in
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
        .frame(maxHeight: .infinity, alignment: .top)
        .padding(15)
        .background(Color("Background"))
        
        
    }
}

struct Today_Previews: PreviewProvider {
    static var previews: some View {
        Today()
    }
}
