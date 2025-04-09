//
//  WorkoutConstuctor.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 04.03.2025.
//

import SwiftUI

struct WorkoutConstuctorView: View {
    @StateObject var dataSource = DataSource()
    
    @Binding var myWorkouts: [Workout]
    @Binding var isShowConstructot: Bool
    @State var name: String = ""
    @State var description: String = ""
    @State var selectedMuscles: [MuscleGroup] = []
    @State var selectedExercises: [Exercise] = []
    
    @Binding var workout: Workout?

    @State private var isExpandedDict: [Int: Bool] = [
        :
    ]
    @State private var exerciseIndex: Int = 0
    @State private var isShowAllExrecises: Bool = false
    
    init(workout: Binding<Workout?>, myWorkouts: Binding<[Workout]>, isShowConstructot: Binding<Bool>) {
        self._workout = workout
        self._myWorkouts = myWorkouts
        self._isShowConstructot = isShowConstructot
    }
    
    var body: some View {
        NavigationView{
            GeometryReader { geometry in
                ScrollView{
                    Form {
                        Section {
                            TextField("Название тренировки", text: $name)
                            
                            TextField("Описание тренивроки", text: $description)
                        }
                        .listRowBackground(Color(dataSource.selectedTheme.buttonsBackgroundColor)) // Фон только для этой секции
                        
//                        Section(header: Text("Целевые мышцы")) {
//                            ForEach(MuscleGroup.allCases, id: \.self) { muscle in
//                                
//                                HStack{
//                                    Text("\(muscle.rawValue)")
//                                        .font(Font.custom(Fonts.ReadexPro_Medium.rawValue, size: 16))
//                                        .foregroundColor(Color(dataSource.selectedTheme.secondaryFontColor))
//                                        .frame(maxWidth: .infinity, alignment: .leading)
//                                    
//                                    Toggle(isOn: Binding<Bool>(
//                                        get: {
//                                            selectedMuscles.contains(muscle)
//                                        },
//                                        set: { newValue in
//                                            if newValue {
//                                                // Если пользователь включил тумблер, добавляем значение в массив
//                                                selectedMuscles.append(muscle)
//                                            } else {
//                                                // Если пользователь выключил тумблер, убираем из массива
//                                                selectedMuscles.removeAll { $0 == muscle }
//                                            }
//                                        }
//                                    )) {
//                                        EmptyView() // Пустая подпись, т.к. текст у нас уже слева
//                                    }
//                                    .toggleStyle(CustomToggleStyle())
//                                }
//                            }
//                        }
//                        .listRowBackground(Color(dataSource.selectedTheme.secondaryBackgroundColor)) // Фон только для этой секции
//
//                        
//                        Section(header: Text("Упражнения")) {
//                            if selectedExercises.count > 0 {
//                                
//                                ForEach(selectedExercises.indices, id: \.self) { index in
//                                    let exercise = selectedExercises[index]
//                                    VStack{
//                                        DisclosureGroup(exercise.name, isExpanded: Binding(
//                                            get: { isExpandedDict[exercise.id] ?? false },
//                                            set: { isExpandedDict[exercise.id] = $0 }
//                                        )){
//                                            VStack(alignment: .leading, spacing: 5){
//                                                TextField("Название упражнения: \(exercise.name)", text: $selectedExercises[index].name)
//                                                    .font(Font.custom(Fonts.ReadexPro_Medium.rawValue, size: 16))
//                                                    .foregroundColor(Color(dataSource.selectedTheme.secondaryFontColor))
//                                                
//                                                HStack {
//                                                    Text("Количество подходов: \(exercise.sets)")
//                                                        .font(Font.custom(Fonts.ReadexPro_Medium.rawValue, size: 16))
//                                                        .foregroundColor(Color(dataSource.selectedTheme.secondaryFontColor))
//                                                    
//                                                    Stepper("", value: $selectedExercises[index].sets, in: 0...10)
//                                                }
//                                                
//                                                HStack {
//                                                    Text("Количество повторений: \(exercise.reps)")
//                                                        .font(Font.custom(Fonts.ReadexPro_Medium.rawValue, size: 16))
//                                                        .foregroundColor(Color(dataSource.selectedTheme.secondaryFontColor))
//                                                    
//                                                    Stepper("", value: $selectedExercises[index].reps, in: 0...10)
//                                                }
//                                                
//                                                HStack {
//                                                    Text("Время отдыха(мин): \(exercise.restTime)")
//                                                        .font(Font.custom(Fonts.ReadexPro_Medium.rawValue, size: 16))
//                                                        .foregroundColor(Color(dataSource.selectedTheme.secondaryFontColor))
//                                                    
//                                                    Stepper("", value: $selectedExercises[index].restTime, in: 0...10)
//                                                }
//                                            }
//                                        }
//                                        
//                                    }
//                                    .swipeActions {
//                                        Button(role: .destructive) {
//                                            deleteItem(exercise)
//                                        } label: {
//                                            Label("Удалить", systemImage: "trash")
//                                        }
//                                    }
//                                }
//                            }
//                            
//                            HStack {
//                                Text("Добавить упражнение")
//                                    .font(Font.custom(Fonts.ReadexPro_Medium.rawValue, size: 16))
//                                    .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
//                                    .frame(maxWidth: .infinity, alignment: .leading)
//                                
//                                Image(systemName: "plus")
//                                    .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
//                            }
//                            .onTapGesture {
//                                addNewExercise()
//                            }
//                            
//                        }
//                        .listRowBackground(Color(dataSource.selectedTheme.secondaryBackgroundColor)) // Фон только для этой секции
                        
                        
                    }
                    .scrollContentBackground(.hidden) // Убираем системный фон
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.2)
                    
                    Text("Выбранные упражнения")
                        .font(Font.custom(Fonts.ReadexPro_Medium.rawValue, size: 23))
                        .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    VStack{
                        if selectedExercises.count > 0{
                            ForEach(selectedExercises, id: \.id) { exercise in
                                CardView(
                                    geometry: geometry,
                                    cardModel: exercise,
                                    onDelete: { deleteExercise(exercise) })
                            }
                        }
                        
                        AddWorkoutButton(
                            geometry: geometry,
                            onAdd: { addNewExercise() })
                        
                    }
                    
                    Button(action: {
                        saveWorkout()
                    }) {
                        Text(workout == nil ? "Создать тренировку" : "Сохранить")
                            .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 16))
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: true, vertical: true)
                            .padding()
                            .frame(width: geometry.size.width * 0.8,
                                   height: geometry.size.height * 0.1)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(selectedExercises.isEmpty ?
                                          Color(dataSource.selectedTheme.buttonsBackgroundColor) :
                                            Color(dataSource.selectedTheme.primaryColor))
                            )
                            .foregroundColor(Color(dataSource.selectedTheme.backgroundColor))
                    }
                    .disabled(selectedExercises.isEmpty)
                }
                .scrollContentBackground(.hidden) // Убираем системный фон
                
            }
            .onAppear {
                if let workout = workout {
                    self.name = workout.name
                    self.description = workout.description
//                    self.selectedMuscles = workout.targetMuscles
                    self.selectedExercises = workout.exercises
                }
            }
            .sheet(isPresented: $isShowAllExrecises, content: {
                AllExerciseView()
            })
            .accentColor(Color(dataSource.selectedTheme.primaryColor))
            .background(Color(dataSource.selectedTheme.backgroundColor))
            .navigationTitle(workout == nil ? "Создание тренировки" : "Редактирование тренировки")
        }
    }
    
    private func addNewExercise() {
//        let newExercise = Exercise(
//            id: exerciseIndex,
//            name: "Новое упражнение \(exerciseIndex)",
//            description: "",
//            sets: 0,
//            reps: 0,
//            restTime: 0,
//            createdAt: "",
//            createdBy: "")
//        selectedExercises.append(newExercise)
//        exerciseIndex += 1
        isShowAllExrecises.toggle()
    }
    
    private func deleteExercise(_ item: Exercise) {
        selectedExercises.removeAll { $0 == item }
    }
    
    private func saveWorkout() {
        if workout != nil {
            isShowConstructot = false
            workout?.name = name
            workout?.description = description
            workout?.exercises = selectedExercises
//            workout?.targetMuscles = selectedMuscles
            
            print(workout?.name)
        }
        else{
            let newWorkout = Plugs.workout1
            
            myWorkouts.append(newWorkout)
            isShowConstructot = false
        }
    }
}

#Preview {
    WorkoutConstuctorView(workout: .constant(nil), myWorkouts: .constant([]), isShowConstructot: .constant(true))
}
