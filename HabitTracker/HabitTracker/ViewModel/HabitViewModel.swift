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
    @Published var isReminderOn: Bool = false
    @Published var reminderText: String = ""
    @Published var reminderDate: Date = Date()
}
