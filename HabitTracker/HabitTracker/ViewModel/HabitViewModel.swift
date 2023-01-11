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
    @Published var isReminderOn: Bool = false
    @Published var reminderText: String = ""
    @Published var reminderDate: Date = Date()
    
    @Published var editHabit: Habit?
    
    @Published var showTimePicker: Bool = false
    
    func addHabit(context: NSManagedObjectContext) async -> Bool {
        let newHabit = Habit(context: context)
        newHabit.title = title
        newHabit.color = habitColor
        newHabit.weekDays = weekDays
        newHabit.isReminderOn = isReminderOn
        newHabit.reminderText = reminderText
        newHabit.notificationDate = reminderDate
        newHabit.notificationIDs = []
        
        if isReminderOn {
            if let ids = try? await schedudleNotification() {
                newHabit.notificationIDs = ids
                
                if let _ = try? context.save() {
                     return true
                }
            }
        } else {
            if let _ = try? context.save() {
                 return true
            }
        }
        
        return false
    }
    
    func restoreEditData() {
        if let editHabit = editHabit {
            title = editHabit.title ?? ""
            habitColor = editHabit.color ?? "0.0 0.0 1.0 0.5"
            weekDays = editHabit.weekDays ?? []
            isReminderOn = editHabit.isReminderOn
            reminderText = editHabit.reminderText ?? ""
            reminderDate = editHabit.notificationDate ?? Date()
        }
    }
    
    func schedudleNotification() async throws -> [String] {
        let content = UNMutableNotificationContent()
        content.title = "Habit reminder"
        content.subtitle = reminderText
        content.sound = UNNotificationSound.default
        
        var notificationIDs: [String] = []
        let calendar = Calendar.current
        let weekdaySymbols: [String] = calendar.weekdaySymbols
        
        for weekDay in weekDays {
            let id = UUID().uuidString
            
            let hour = calendar.component(.hour, from: reminderDate)
            let minute = calendar.component(.minute, from: reminderDate)
            let day = weekdaySymbols.firstIndex { currentDay in
                return currentDay == weekDay
            } ?? -1
            
            if day != -1 {
                var components = DateComponents()
                
                components.hour = hour
                components.minute = minute
                components.day = day + 1
                
                let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
                
                let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
                
                try await UNUserNotificationCenter.current().add(request)
                
                notificationIDs.append(id)
            }
        }
        
        return notificationIDs
        
    }
    
    func resetData() {
        title = ""
        habitColor = "0.0 0.0 1.0 0.5"
        weekDays = []
        isReminderOn = false
        reminderText = ""
        reminderDate = Date()
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
        let reminderStatus = isReminderOn ? reminderText == "" : false
        
        if title == "" || weekDays.isEmpty || reminderStatus {
            return false
        }
        return true
    }
}
