//
//  PlanConstructorView.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 06.03.2025.
//

import SwiftUI
import Foundation

struct PlanConstructorView: View{
    @StateObject var dataSource = DataSource()
    
    @Binding var myPlans: [Plan]
    @Binding var isShowConstructot: Bool
    @State var name: String = ""
    @State var description: String = ""

    @State var selectedSchedule: [DayOfWeek: [Workout]] = [
        .monday: [
            Workout(
                id: 1,
                name: "Тренировка плеч 1",
                description: "Интенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого пояса",
                exercises: [
                    Exercise(
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
                        createdBy: "никита смирнов"),
                    Exercise(
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
                        createdBy: "никита смирнов"),
                    Exercise(
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
                        createdBy: "никита смирнов")
                ],
    //            targetMuscles: [.shoulders],
                createdBy: "Николаев Роман",
                createdAt: "10.01.25"),
            Workout(
                id: 1,
                name: "Тренировка плеч 1",
                description: "Интенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого пояса",
                exercises: [
                    Exercise(
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
                        createdBy: "никита смирнов"),
                    Exercise(
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
                        createdBy: "никита смирнов"),
                    Exercise(
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
                        createdBy: "никита смирнов")
                ],
    //            targetMuscles: [.shoulders],
                createdBy: "Николаев Роман",
                createdAt: "10.01.25"),
            Workout(
                id: 1,
                name: "Тренировка плеч 1",
                description: "Интенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого пояса",
                exercises: [
                    Exercise(
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
                        createdBy: "никита смирнов"),
                    Exercise(
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
                        createdBy: "никита смирнов"),
                    Exercise(
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
                        createdBy: "никита смирнов")
                ],
    //            targetMuscles: [.shoulders],
                createdBy: "Николаев Роман",
                createdAt: "10.01.25")
        ],
        .tuesday: [],
        .wednesday: [],
        .thursday: [],
        .friday: [
            Workout(id: 1, name: "Тренировка плеч 1", description: "Интенсивная тренировка для развития плечевого пояса", createdBy: "Николаев Роман", createdAt: "10.01.25"),
        ],
        .saturday: [],
        .sunday: []
    ]
    @State var selectedWorkouts: [Workout] = []
    @State var currentSelectedWorkout: Workout? = nil
    
    @State private var isExpandedDict: [Int: Bool] = [
//        0: false,
//        1: false
        :
    ]
    @State private var exerciseIndex: Int = 0
    @State private var currentSelectedDay: DayOfWeek = .monday
    @State private var isShowAllWorkouts: Bool = false
    @Binding var plan: Plan?
    
    init(plan: Binding<Plan?>, isShowConstructot: Binding<Bool>, myPlans: Binding<[Plan]>) {
        self._plan = plan
        self._isShowConstructot = isShowConstructot
        self._myPlans = myPlans
    }
    
    var body: some View {
        NavigationView{
            GeometryReader { geometry in
                ScrollView(.vertical, showsIndicators: false) {
                    Form{
                        Section {
                            TextField("Название плана", text: $name)
                            
                            TextField("Описание плана", text: $description)
                        }
                        .listRowBackground(Color(dataSource.selectedTheme.secondaryBackgroundColor)) // Фон только для этой секции
                    }
                    .scrollContentBackground(.hidden) // Убираем системный фон
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.2)
                    
                    selectTrainingDay(geometry: geometry)
                    
                    Button(action: {
    //                    saveWorkout()
                    }) {
                        Text(plan == nil ? "Создать тренировку" : "Сохранить")
                            .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 16))
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: true, vertical: true)
                            .padding()
                            .frame(width: geometry.size.width * 0.8,
                                   height: geometry.size.height * 0.1)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(selectedWorkouts.isEmpty ?
                                          Color(dataSource.selectedTheme.buttonsBackgroundColor) :
                                            Color(dataSource.selectedTheme.primaryColor))
                            )
                            .foregroundColor(Color(dataSource.selectedTheme.backgroundColor))
                    }
                    .disabled(selectedWorkouts.isEmpty)

                }
                .accentColor(Color(dataSource.selectedTheme.primaryColor))
                .navigationTitle("Создание плана")
            }
            .background(Color(dataSource.selectedTheme.backgroundColor))
            .sheet(isPresented: $isShowAllWorkouts) {
                AllWorkoutsView()
                    .presentationDetents([.large])
            }
            .onAppear(){
                if let plan = plan {
                    self.name = plan.name
                    self.description = plan.description
                    
                }
            }
        }
    }
    
    private func addNewExercise() {
        let newWorkout = currentSelectedWorkout
        
        if (newWorkout != nil) {
            selectedWorkouts.append(newWorkout!)
            exerciseIndex += 1
        }
    }
    
    private func deleteItem(currentDay: DayOfWeek, currentWorkout: Workout) {
        selectedSchedule[currentDay]?.removeAll{ $0 == currentWorkout }
    }
    
    private func saveWorkout() {
        let newPlan = Plan(id: 0, name: name, description: description, createdBy: "Долбаебик юзер", createdAt: "09.12.33")
        
        myPlans.append(newPlan)
        isShowConstructot = false
    }
    
    private func selectTrainingDay(geometry: GeometryProxy) -> some View{
        VStack{
            HStack(alignment: .center, spacing: 30){
                ForEach(DayOfWeek.allCases, id: \.self) { day in
                    Text(day.rawValue)
                        .font(Font.custom(Fonts.ReadexPro_Medium.rawValue, size: 16))
                        .background {
                            Circle()
                                .fill(day == currentSelectedDay ?
                                      Color(dataSource.selectedTheme.primaryColor) :
                                        Color(dataSource.selectedTheme.secondaryBackgroundColor))
                                .frame(width: geometry.size.width * 0.1, height: geometry.size.width * 0.1)
                        }
                        .foregroundColor(day == currentSelectedDay ?
                                         Color(dataSource.selectedTheme.secondaryBackgroundColor) :
                                            Color(dataSource.selectedTheme.primaryColor))
                        .onTapGesture {
                            withAnimation {
                                currentSelectedDay = day
                            }
                        }
                }
            }
            .padding()
            
            
            if (selectedSchedule[currentSelectedDay] ?? []).count > 0{
                ForEach(selectedSchedule[currentSelectedDay] ?? [], id: \.self){ workout in
                    CardView(geometry: geometry, cardModel: workout)
                }
            }
            
            AddWorkoutButton(geometry: geometry)
                .onTapGesture {
                    withAnimation {
                        isShowAllWorkouts.toggle()
                    }
                }
        }
    }
}

//struct AddWorkoutButton: View {
//    var geometry: GeometryProxy
//    @StateObject var dataSource = DataSource()
//    var body: some View {
//        ZStack{
//            RoundedRectangle(cornerRadius: 20)
//                .fill(Color(dataSource.selectedTheme.buttonsBackgroundColor))
//                
//            VStack {
//                
//                Image(systemName: "plus.circle")
//                    .resizable()
//                    .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
//                    .frame(width: geometry.size.width * 0.2, height: geometry.size.width * 0.2)
//            }
//        }
//        .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.2)
//
//    }
//}
    
#Preview {
    PlanConstructorView(plan: .constant(nil), isShowConstructot: .constant(true), myPlans: .constant([]))
//    GeometryReader { geometry in
//        addWorkoutButton(geometry: geometry)
//    }
}
