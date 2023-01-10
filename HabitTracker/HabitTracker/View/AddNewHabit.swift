//
//  AddNewHabit.swift
//  HabitTracker
//
//  Created by Jakub Szczepanek on 10/01/2023.
//

import SwiftUI

struct AddNewHabit: View {
    
    @FetchRequest(entity: Habit.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Habit.dateAdded, ascending: false)], predicate: nil, animation: .easeInOut) var habits: FetchedResults<Habit>
    @StateObject var habitModel: HabitViewModel = .init()
//    @EnvironmentObject var habitModel: HabitViewModel
    
    @State private var color = Color(UIColor().generateColor(rgba: "0.0 0.0 1.0 0.5"))
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Title", text: $habitModel.title)
                    .padding(.horizontal)
                    .padding(.vertical)
                    .background(.gray.opacity(0.3), in: RoundedRectangle(cornerRadius: 6))
                
                ColorPicker("Color", selection: $color, supportsOpacity: false)
                    .padding(.horizontal)
                    .padding(.vertical)
                    .background(.gray.opacity(0.3), in: RoundedRectangle(cornerRadius: 6))
                    .onChange(of: color) { newColor in
                        let colorString = newColor.description
                            .replacingOccurrences(of: "kCGColorSpaceModelRGB ", with: "")
                        
                        habitModel.habitColor = colorString
                    }
                
                
                VStack {
                    Text("Frequency")
                    
                    let weekDays = Calendar.current.weekdaySymbols
                    HStack {
                        ForEach(weekDays, id: \.self) { day in
                            let index = habitModel.weekDays.firstIndex { value in
                                return value == day
                            } ?? -1
                            
                            Text(day.prefix(2))
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical)
                                .background(RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(index != -1 ? Color(UIColor().generateColor(rgba: habitModel.habitColor)) : .gray.opacity(0.3)))
                                .onTapGesture {
                                    withAnimation {
                                        if index != -1 {
                                            habitModel.weekDays.remove(at: index)
                                        } else {
                                            habitModel.weekDays.append(day)
                                        }
                                    }
                                }
                        }
                    }
                }
                .padding(.vertical)
                    
            }
            .frame(maxWidth: .infinity, alignment: .top)
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Add habit")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        
                    } label: {
                        Image(systemName: "xmark.circle")
                    }
                    .tint(.black)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Text("Done")
                    }
                    .tint(.black)
                }
            }
        }
    }
}

struct AddNewHabit_Previews: PreviewProvider {
    static var previews: some View {
        AddNewHabit()
            .environmentObject(HabitViewModel())
    }
}

extension Color {
    func generateColor(color: UIColor) -> Color {
        return Color.init(uiColor: color)
    }
}

extension UIColor {
    func generateColor(rgba: String) -> UIColor {
        let rgbaList = rgba.components(separatedBy: " ").map { CGFloat(Double($0) ?? 0.0) }
        
        return UIColor.init(red: rgbaList[0], green: rgbaList[1], blue: rgbaList[2], alpha: rgbaList[3])
    }
}