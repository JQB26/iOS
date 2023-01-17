////
////  TodaysHabits.swift
////  HabitTracker
////
////  Created by Jakub Szczepanek on 17/01/2023.
////
//
//import SwiftUI
//
//class TodaysHabitsViewModel: ObservableObject {
//    @FetchRequest(entity: Habit.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Habit.dateAdded, ascending: false)], predicate: nil, animation: .easeInOut) var habits: FetchedResults<Habit>
//
//    @Published var todaysHabits: [TodaysHabitsViewModel] = []
//    
//    func loadData() {
//        let calendar = Calendar.current
//        let todayWeekday = calendar.dateComponents([.weekday], from: Date()).weekday
//        let todayWeekdaySymbol = calendar.weekdaySymbols[todayWeekday! - 1]
//        let todayHabits = habits.filter { $0.weekDays?.contains(todayWeekdaySymbol) ?? false }
//
//        for habit in todayHabits {
//            var todayHabitViewModel = TodayHabitViewModel()
//            todayHabitViewModel.uuid = habit.uuid!
//            todayHabitViewModel.todaysDate = Date()
//            todayHabitViewModel.title = habit.title!
//            todayHabitViewModel.habitColor = habit.color!
//            todayHabitViewModel.doneToday =
//        }
//    }
//}
//
//class TodayHabitViewModel: ObservableObject {
//    @Published var uuid: UUID = UUID()
//    @Published var todaysDate: Date = Date()
//
//    @Published var title: String = ""
//    @Published var habitColor: String = "0.0 0.0 1.0 0.5"
//
//    @Published var doneToday: Bool = false
//}
