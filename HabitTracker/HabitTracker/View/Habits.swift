//
//  Habits.swift
//  HabitTracker
//
//  Created by Jakub Szczepanek on 12/01/2023.
//

import SwiftUI

struct Habits: View {
    @FetchRequest(entity: Habit.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Habit.dateAdded, ascending: false)], predicate: nil, animation: .easeInOut) var habits: FetchedResults<Habit>
    @StateObject var habitModel: HabitViewModel = .init()
    
    var body: some View {
        VStack {
            Text("Habit Tracker")
                .font(.title.bold())
                .frame(maxWidth: .infinity)
                .foregroundColor(Color("Color"))
            
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
            
            ScrollView(habits.isEmpty ? .init() : .vertical, showsIndicators: false) {
                VStack {
                    ForEach(habits) { habit in
                        HabitCardView(habit: habit)
                    }
                }
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding(15)
        .background(Color("Background"))
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
                
                Spacer()
                
                let count = (habit.weekDays?.count ?? 0)
                Text(count == 7 ? "Everyday" : "\(count) times a week")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(3)
            
            let calendar = Calendar.current
            let currentWeek = calendar.dateInterval(of: .weekOfMonth, for: Date())
            let symbols = calendar.weekdaySymbols
            let startDate = currentWeek?.start ?? Date()
            let activeWeekDays = habit.weekDays ?? []
            let activePlot = symbols.indices.compactMap { index -> (String, Date) in
                let currentDate = calendar.date(byAdding: .day, value: index, to: startDate)
                
                return (symbols[index], currentDate!)
            }
            
            HStack {
                ForEach(activePlot.indices, id: \.self) { index in
                    let item = activePlot[index]
                    
                    VStack {
                        Text(item.0.prefix(3))
                            .font(.caption)
                            .foregroundColor(.white)
                        
                        let status = activeWeekDays.contains { day in
                            return day == item.0
                        }
                        
                        Text(getDate(date: item.1))
                            .font(.system(size: 14))
                            .padding(8)
                            .lineLimit(1)
                            .fontWeight(.semibold)
                            .background {
                                Circle()
                                    .fill((Color(UIColor().generateColor(rgba: habit.color ?? "0.0 0.0 1.0 0.5"))))
                                    .opacity(status ? 1 : 0)
                            }
                    }
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .padding(.vertical)
        .padding(.horizontal)
        .background {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color("Color 3"))
        }
        .onTapGesture {
            habitModel.editHabit = habit
            habitModel.restoreEditData()
            habitModel.addNewHabit.toggle()
        }
    }
    
    func getDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        
        return formatter.string(from: date)
    }
}

struct Habits_Previews: PreviewProvider {
    static var previews: some View {
        Habits()
    }
}
