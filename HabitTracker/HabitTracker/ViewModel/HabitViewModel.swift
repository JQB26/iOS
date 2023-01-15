//
//  HabitViewModel.swift
//  HabitTracker
//
//  Created by Jakub Szczepanek on 10/01/2023.
//

import SwiftUI
import CoreData
import UserNotifications

class HabitViewModel: ObservableObject {
    @Published var addNewHabit: Bool = false
    
    @Published var title: String = ""
    @Published var habitColor: String = "0.0 0.0 1.0 0.5"
    @Published var weekDays: [String] = []
    
    @Published var editHabit: Habit?
    
    func addHabit(context: NSManagedObjectContext) async -> Bool {
        let habit = Habit(context: context)
        
        habit.title = title
        habit.color = habitColor
        habit.weekDays = weekDays
        
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
        }
    }
    
    func resetData() {
        title = ""
        habitColor = "0.0 0.0 1.0 0.5"
        weekDays = []
        editHabit = nil
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
