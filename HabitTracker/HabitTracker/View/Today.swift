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
    
    @EnvironmentObject var habitModel: HabitViewModel
    
    var body: some View {
        VStack {
            Text("Habit Tracker")
                .font(.title.bold())
                .foregroundColor(Color("Color"))
                .frame(maxWidth: .infinity)
        
            let calendar = Calendar.current
            let todayWeekday = calendar.dateComponents([.weekday], from: Date()).weekday
            let todayWeekdaySymbol = calendar.weekdaySymbols[todayWeekday! - 1]
            let todayHabits = habits.filter { $0.weekDays?.contains(todayWeekdaySymbol) ?? false }
            
            ForEach(todayHabits) { habit in
                HStack {
                    Image(systemName: habit.doneToday ? "circle.fill" : "circle")
                        .foregroundColor(Color(UIColor().generateColor(rgba: habit.color ?? "0.0 0.0 1.0 0.5")))
                        .onTapGesture {
                            withAnimation {
                                habit.doneToday.toggle()
                            }
                        }
                    
                    Text(habit.title ?? "")
                        .font(.callout.bold())
                        .foregroundColor(Color("Color"))
                }
                .padding(.horizontal)
                .padding(.vertical)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color("Color 4"), in: RoundedRectangle(cornerRadius: 6))
                
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
