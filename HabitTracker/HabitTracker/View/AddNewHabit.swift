//
//  AddNewHabit.swift
//  HabitTracker
//
//  Created by Jakub Szczepanek on 10/01/2023.
//

import SwiftUI

struct AddNewHabit: View {
    
    @EnvironmentObject var habitModel: HabitViewModel
    @Environment(\.self) var env
    
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
                            
                            Text(day.prefix(3))
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
                
                Divider()
                
                HStack {
                    Spacer()
                    
                    VStack {
                        Text("Reminder")
                        
                        Text("Notification")
                            .font(.caption)
                            .fontWeight(.thin)
                    }
                    
                    Spacer()
                    
                    Toggle(isOn: $habitModel.isReminderOn) {}
                        .labelsHidden()
                    
                    Spacer()
                }
                .padding()
                .opacity(habitModel.notificationAccess ? 1 : 0)
                
                HStack {
                    Label {
                        Text(habitModel.reminderDate.formatted(date: .omitted, time: .shortened))
                    } icon: {
                        Image(systemName: "clock")
                    }
                    .padding(.horizontal)
                    .padding(.vertical)
                    .background(.gray.opacity(0.3), in: RoundedRectangle(cornerRadius: 6))
                    .onTapGesture {
                        withAnimation {
                            habitModel.showTimePicker.toggle()
                        }
                    }
                    
                    TextField("Reminder Text", text: $habitModel.reminderText)
                        .padding(.horizontal)
                        .padding(.vertical)
                        .background(.gray.opacity(0.3), in: RoundedRectangle(cornerRadius: 6))
                }
                .frame(height: habitModel.isReminderOn ? nil : 0)
                .opacity(habitModel.isReminderOn ? 1 : 0)
                    
            }
            .animation(.easeInOut, value: habitModel.isReminderOn)
            .frame(maxWidth: .infinity, alignment: .top)
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(habitModel.editHabit == nil ? "Add habit" : "Edit habit")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        env.dismiss()
                    } label: {
                        Image(systemName: "xmark.circle")
                    }
                    .tint(.black)
                }
                
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        if habitModel.deleteHabit(context: env.managedObjectContext) {
                            env.dismiss()
                        }
                    } label: {
                        Image(systemName: "trash")
                    }
                    .tint(.red)
                    .opacity(habitModel.editHabit == nil ? 0 : 1)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        Task {
                            if await habitModel.addHabit(context: env.managedObjectContext) {
                                env.dismiss()
                            }
                        }
                    } label: {
                        Text("Done")
                    }
                    .tint(.black)
                    .disabled(!habitModel.doneStatus())
                    .opacity(habitModel.doneStatus() ? 1 : 0.5)
                }
            }
        }
        .overlay {
            if habitModel.showTimePicker {
                ZStack {
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation {
                                habitModel.showTimePicker.toggle()
                            }
                        }

                    DatePicker.init("", selection: $habitModel.reminderDate, displayedComponents: [.hourAndMinute])
                        .datePickerStyle(.wheel)
                        .labelsHidden()
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.gray)
                        }
                        .padding()
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
