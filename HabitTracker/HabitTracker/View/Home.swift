//
//  Home.swift
//  HabitTracker
//
//  Created by Jakub Szczepanek on 10/01/2023.
//

import SwiftUI
import CoreData

struct Home: View {
    
    @FetchRequest(entity: Habit.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Habit.dateAdded, ascending: false)], predicate: nil, animation: .easeInOut) var habits: FetchedResults<Habit>
    @StateObject var habitModel: HabitViewModel = .init()
    
    var body: some View {
        VStack {
            Text("Habit Tracker")
                .font(.title.bold())
                .frame(maxWidth: .infinity)
                
            
            ScrollView(habits.isEmpty ? .init() : .vertical, showsIndicators: false) {
                VStack {
                    ForEach(habits) { habit in
                        HabitCardView(habit: habit)
                    }
                    
                    Button {
                        habitModel.addNewHabit.toggle()
                    } label: {
                        Label {
                            Text("New habit")
                        } icon: {
                            Image(systemName: "plus.circle")
                        }
                        .font(.callout.bold())
                        .foregroundColor(.black)
                    }
                    .padding(5)
                    .frame(maxWidth: .infinity, alignment: .center)
                }
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding(15)
        .sheet(isPresented: $habitModel.addNewHabit) {
            habitModel.resetData()
        } content: {
            AddNewHabit()
                .environmentObject(habitModel)
        }
    }
    
    @ViewBuilder
    func HabitCardView(habit: Habit) -> some View {
        VStack {
            HStack {
                Text(habit.title ?? "")
                    .font(.callout)
                    .lineLimit(1)
                
                Image(systemName: "bell.badge.fill")
                    .font(.callout)
                    .foregroundColor(Color(UIColor().generateColor(rgba: habit.color ?? "0.0 0.0 1.0 0.5")))
                    .opacity(habit.isReminderOn ? 1 : 0)
                
                Spacer()
                
                let count = (habit.weekDays?.count ?? 0)
                Text(count == 7 ? "Everyday" : "\(count) times a week")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
