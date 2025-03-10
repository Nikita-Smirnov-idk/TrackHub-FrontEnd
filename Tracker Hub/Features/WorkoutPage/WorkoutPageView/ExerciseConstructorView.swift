//
//  ExerciseConstructorView.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 08.03.2025.
//

import SwiftUI

struct ExerciseConstructorView: View {
    @StateObject private var dataSource = DataSource()
    
    @State private var name: String = ""
    @State private var description: String = ""
    @State private var targetMuscle: [String] = []
    @State private var gymEquipment: [String] = []
    @State private var preview: String = ""
    @State private var vidoe: String = ""
    @State private var sets: Int = 0
    @State private var reps: Int = 0
    @State private var restTime: Int = 0
    @State private var instructions: [String] = []
    
    @State private var currentInstructionIndex: Int = 1
    @Binding var isShowConstructor: Bool
    
    @Binding var exercise: Exercise?
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack{
                    Form {
                        Section{
                            TextField("Название тренировки", text: $name)
                            
                            TextField("Описание тренивроки", text: $description)
                        }
                        .listRowBackground(Color(dataSource.selectedTheme.secondaryBackgroundColor)) // Фон только для этой секции
                        
                        Section{
                            HStack {
                                Text("Количество подходов: \(sets)")
                                    .font(Font.custom(Fonts.ReadexPro_Medium.rawValue, size: 16))
                                    .foregroundColor(Color(dataSource.selectedTheme.secondaryFontColor))
                                
                                Stepper("", value: $sets, in: 0...10)
                            }
                            
                            HStack {
                                Text("Количество повторений: \(reps)")
                                    .font(Font.custom(Fonts.ReadexPro_Medium.rawValue, size: 16))
                                    .foregroundColor(Color(dataSource.selectedTheme.secondaryFontColor))
                                
                                Stepper("", value: $reps, in: 0...10)
                            }
                            
                            HStack {
                                Text("Время отдыха(мин): \(restTime)")
                                    .font(Font.custom(Fonts.ReadexPro_Medium.rawValue, size: 16))
                                    .foregroundColor(Color(dataSource.selectedTheme.secondaryFontColor))
                                
                                Stepper("", value: $restTime, in: 0...10)
                            }
                        }
                        .listRowBackground(Color(dataSource.selectedTheme.secondaryBackgroundColor))
                        
                        Section(header: Text("Целевые мышцы")) {
                            muscleGroupPicker()
                        }
                        .listRowBackground(Color(dataSource.selectedTheme.secondaryBackgroundColor))
                        
                        Section{
                            if instructions.count > 0 {
                                ForEach(0..<instructions.count, id: \.self) { index in
                                    TextField("Инструкция \(index + 1)", text: $instructions[index])
                                        .font(Font.custom(Fonts.ReadexPro_Medium.rawValue, size: 16))
                                        .foregroundColor(Color(dataSource.selectedTheme.secondaryFontColor))
                                        .swipeActions {
                                            Button(role: .destructive) {
                                                instructions.removeAll { $0 == instructions[index] }
                                            } label: {
                                                Label("Удалить", systemImage: "trash")
                                            }
                                        }
                                }
                            }
                            
                            HStack {
                                Text("Добавить шаг")
                                    .font(Font.custom(Fonts.ReadexPro_Medium.rawValue, size: 16))
                                    .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Image(systemName: "plus")
                                    .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
                            }
                            .onTapGesture {
                                instructions.append("\(currentInstructionIndex).Новый шаг")
                                currentInstructionIndex += 1
                            }
                        }
                        .listRowBackground(Color(dataSource.selectedTheme.secondaryBackgroundColor))
                        
                    }
                    .scrollContentBackground(.hidden)
                    
                    Button(action: {
    //                    saveWorkout()
                    }) {
                        Text(exercise == nil ? "Создать тренировку" : "Сохранить")
                            .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 16))
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: true, vertical: true)
                            .padding()
                            .frame(width: geometry.size.width * 0.7,
                                   height: geometry.size.height * 0.1)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(instructions.isEmpty ?
                                          Color(dataSource.selectedTheme.buttonsBackgroundColor) :
                                            Color(dataSource.selectedTheme.primaryColor))
                            )
                            .foregroundColor(Color(dataSource.selectedTheme.backgroundColor))
                    }
                    .disabled(instructions.isEmpty)
                }
               
            }
            .accentColor(Color(dataSource.selectedTheme.primaryColor))
            .background(Color(dataSource.selectedTheme.backgroundColor))
            .navigationTitle(exercise == nil ? "Создание" : "Редактирование")
            .onAppear(){
                if let exercise = exercise {
                    self.name = exercise.name
                    self.description = exercise.description
                    self.targetMuscle = exercise.targetMuscle
                    self.gymEquipment = exercise.gymEquipment
                    self.preview = exercise.preview
                    self.vidoe = exercise.vidoe
                    self.sets = exercise.sets
                    self.reps = exercise.reps
                    self.restTime = exercise.restTime
                }
            }
        }
    }
    
    private func muscleGroupPicker() -> some View {
        ForEach(MuscleGroup.allCases, id: \.self) { muscle in
            HStack{
                Text(muscle.rawValue)
                    .font(Font.custom(Fonts.ReadexPro_Medium.rawValue, size: 16))
                    .foregroundColor(Color(dataSource.selectedTheme.secondaryFontColor))
                    .frame(maxWidth: .infinity, alignment: .leading)

                Toggle(isOn: Binding<Bool>(
                    get: {
                        targetMuscle.contains(muscle.rawValue)
                    },
                    set: { newValue in
                        if newValue {
                            // Если пользователь включил тумблер, добавляем значение в массив
                            targetMuscle.append(muscle.rawValue)
                        } else {
                            // Если пользователь выключил тумблер, убираем из массива
                            targetMuscle.removeAll { $0 == muscle.rawValue }
                        }
                    }
                )) {
                    EmptyView() // Пустая подпись, т.к. текст у нас уже слева
                }
                .toggleStyle(CustomToggleStyle())
            }
        }
    }
}

#Preview {
    ExerciseConstructorView(isShowConstructor: .constant(true), exercise: .constant(Exercise(
        id: 0,
        name: "Приседы",
        description: "Приседы епта",
        targetMuscle: ["Ягодицы", "Квадрицепс"],
        gymEquipment: ["Тренажер Смитта"],
        instructions: ["Подойдите к тренажеру", "Нажмите на кнопку начать", "Выполняйте", "Думайте о жизни"],
        preview: "",
        vidoe: "",
        sets: 4,
        reps: 12,
        restTime: 60,
        createdAt: "10.20.20",
        createdBy: "никита смирнов")))
    
//    ExerciseConstructorView(isShowConstructor: .constant(true), exercise: .constant(nil))
}
