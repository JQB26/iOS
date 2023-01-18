//
//  HabitViewModel.swift
//  HabitTracker
//
//  Created by Jakub Szczepanek on 10/01/2023.
//

import SwiftUI
import CoreData

class HabitViewModel: ObservableObject {
    @Published var addNewHabit: Bool = false
    
    @Published var title: String = ""
    @Published var habitColor: String = "0.0 0.0 1.0 0.5"
    @Published var weekDays: [String] = []
    @Published var uuid: UUID = UUID()
    
    @Published var doneToday: Bool = false
    @Published var doneTodayChangeDate: Date = Date()
    
    @Published var editHabit: Habit?
    
    func updateDoneToday(context: NSManagedObjectContext) async -> Bool {
        let habit = editHabit!
        
        if !Calendar.current.isDateInToday(habit.doneTodayChangeDate ?? Date.distantPast) {
            habit.doneToday = false
        }
        
        if let _ = try? context.save() {
             return true
        }
        
        return false
    }
    
    func addHabit(context: NSManagedObjectContext) async -> Bool {
        var habit: Habit!

        if let editHabit = editHabit {
            habit = editHabit
        } else {
            habit = Habit(context: context)
        }
        
        habit.title = title
        habit.color = habitColor
        habit.weekDays = weekDays
        habit.uuid = uuid
        habit.doneToday = doneToday
        habit.doneTodayChangeDate = doneTodayChangeDate
        
        if let _ = try? context.save() {
             return true
        }

        return false
    }
    
    func restoreEditData() {
        if let editHabit = editHabit {
            title = editHabit.title ?? ""
            habitColor = editHabit.color ?? "0.0 0.0 1.0 0.5"
            weekDays = editHabit.weekDays ?? []
            uuid = editHabit.uuid ?? UUID()
            doneToday = editHabit.doneToday
            doneTodayChangeDate = editHabit.doneTodayChangeDate ?? Date.now
        }
    }
    
    func resetData() {
        title = ""
        habitColor = "0.0 0.0 1.0 0.5"
        weekDays = []
        editHabit = nil
        uuid = UUID()
        doneToday = false
        doneTodayChangeDate = Date()
    }
    
    func deleteHabit(context: NSManagedObjectContext) -> Bool {
        if let editHabit = editHabit {
            context.delete(editHabit)
            if let _ = try? context.save() {
                return true
            }
        }
        return true
    }
    
    func doneStatus() -> Bool {
        if title == "" || weekDays.isEmpty {
            return false
        }
        return true
    }
}
