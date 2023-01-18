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
            ZStack {
                Color("Background darker")
                    .ignoresSafeArea()
                VStack {
                    TextField("", text: $habitModel.title)
                        .placeholder(when: habitModel.title.isEmpty) {
                            Text("Title").foregroundColor(Color("Color 3"))
                    }
                        .padding(.horizontal)
                        .padding(.vertical)
                        .background(.gray.opacity(0.3), in: RoundedRectangle(cornerRadius: 6))
                        .foregroundColor(Color("Color 3"))
                    
                    ColorPicker("Color", selection: $color, supportsOpacity: false)
                        .padding(.horizontal)
                        .padding(.vertical)
                        .background(.gray.opacity(0.3), in: RoundedRectangle(cornerRadius: 6))
                        .onChange(of: color) { newColor in
                            let colorString = newColor.description
                                .replacingOccurrences(of: "kCGColorSpaceModelRGB ", with: "")
                            
                            habitModel.habitColor = colorString
                        }
                        .foregroundColor(Color("Color 3"))
                    
                    
                    VStack {
                        Text("Frequency")
                            .foregroundColor(Color("Color 3"))
                        
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
                                    .foregroundColor(Color("Color 3"))
                            }
                        }
                    }
                    .padding(.vertical)
                }
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
                        .tint(Color("Color"))
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
                        .tint(Color("Color"))
                        .disabled(!habitModel.doneStatus())
                        .opacity(habitModel.doneStatus() ? 1 : 0.5)
                    }
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

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
