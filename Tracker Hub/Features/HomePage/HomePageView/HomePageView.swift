//
//  HomePageView.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 09.03.2025.
//

import SwiftUI

struct HomePageView: View {
    @StateObject private var dataSource = DataSource()
    var selectedPlan: Plan = Plugs.plan1
    
    var lastSeenCard: any CardRepresentable = Plugs.workout1
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .center, spacing: 50) {
                        HStack{
                            ForEach(DayOfWeek.allCases, id: \.self){ day in
                                let workouts = selectedPlan.schedule[day] ?? []
                                
                                VStack(alignment: .center, spacing: 20) {
                                    Text(day.rawValue)
                                        .font(.custom("ReadexPro-Bold", size: 16))
                                        .foregroundColor(Color(dataSource.selectedTheme.secondaryBackgroundColor))
                                        .frame(width: geometry.size.width * 0.12, height: geometry.size.height * 0.015, alignment: .top)
                                    
                                    Image(systemName: workouts.count > 0 ? "dumbbell" : "")
                                        .resizable()
                                        .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
                                        .frame(width: geometry.size.width * 0.04, height: geometry.size.height * 0.015, alignment: .bottom)
                                    
                                }
                                .padding()
                                .frame(width: geometry.size.width * 0.12, height: geometry.size.height * 0.1, alignment: .center)
                            }
                        }
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color(dataSource.selectedTheme.primaryColor), lineWidth: 2)
                        }
                        
                        
                        VStack(spacing: 10) {
                            Text("Текущий план тренировок")
                                .font(.custom("ReadexPro-Bold", size: 23))
                                .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding(.horizontal)
                            
                            CardView(geometry: geometry, cardModel: selectedPlan)

                        }
                        
                        VStack(spacing: 10) {
                            Text("Последний запуск")
                                .font(.custom("ReadexPro-Bold", size: 23))
                                .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding(.horizontal)
                            
                            if let workout = lastSeenCard as? Workout {
                                CardView(geometry: geometry, cardModel: workout)
                            } else if let plan = lastSeenCard as? Plan {
                                CardView(geometry: geometry, cardModel: plan)
                            } else if let exercise = lastSeenCard as? Exercise {
                                CardView(geometry: geometry, cardModel: exercise)
                            }

                        }
                    }
                    .frame(width: geometry.size.width, alignment: .center)
                }
            }
            .background(Color(dataSource.selectedTheme.backgroundColor))
        }
    }
}

//#Preview {
//    HomePageView(
//        selectedPlan: Plan(
//            id: 9,
//            name: "Тренировка плеч",
//            description: "Интенсивная тренировка для развития плечевого пояса",
//            schedule: [
//                .monday: [
//                    Workout(
//                        id: 1,
//                        name: "Тренировка плеч 1",
//                        description: "Интенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого пояса",
//                        exercises: [
//                            Exercise(
//                                id: 0,
//                                name: "Приседы",
//                                description: "Приседы епта",
//                                targetMuscle: ["Ягодицы", "Квадрицепс"],
//                                gymEquipment: ["Тренажер Смитта"],
//                                instructions: ["Подойдите к тренажеру", "Нажмите на кнопку начать", "Выполняйте", "Думайте о жизни"],
//                                preview: "",
//                                vidoe: "",
//                                sets: 4,
//                                reps: 12,
//                                restTime: 60,
//                                createdAt: "10.20.20",
//                                createdBy: "никита смирнов"),
//                            Exercise(
//                                id: 1,
//                                name: "Приседы",
//                                description: "Приседы епта",
//                                targetMuscle: ["Ягодицы", "Квадрицепс"],
//                                gymEquipment: ["Тренажер Смитта"],
//                                instructions: ["Подойдите к тренажеру", "Нажмите на кнопку начать", "Выполняйте", "Думайте о жизни"],
//                                preview: "",
//                                vidoe: "",
//                                sets: 4,
//                                reps: 12,
//                                restTime: 60,
//                                createdAt: "10.20.20",
//                                createdBy: "никита смирнов"),
//                            Exercise(
//                                id: 2,
//                                name: "Приседы",
//                                description: "Приседы епта",
//                                targetMuscle: ["Ягодицы", "Квадрицепс"],
//                                gymEquipment: ["Тренажер Смитта"],
//                                instructions: ["Подойдите к тренажеру", "Нажмите на кнопку начать", "Выполняйте", "Думайте о жизни"],
//                                preview: "",
//                                vidoe: "",
//                                sets: 4,
//                                reps: 12,
//                                restTime: 60,
//                                createdAt: "10.20.20",
//                                createdBy: "никита смирнов")
//                        ],
//            //            targetMuscles: [.shoulders],
//                        createdBy: "Николаев Роман",
//                        createdAt: "10.01.25"),
//                    Workout(
//                        id: 1,
//                        name: "Тренировка плеч 1",
//                        description: "Интенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого пояса",
//                        exercises: [
//                            Exercise(
//                                id: 3,
//                                name: "Приседы",
//                                description: "Приседы епта",
//                                targetMuscle: ["Ягодицы", "Квадрицепс"],
//                                gymEquipment: ["Тренажер Смитта"],
//                                instructions: ["Подойдите к тренажеру", "Нажмите на кнопку начать", "Выполняйте", "Думайте о жизни"],
//                                preview: "",
//                                vidoe: "",
//                                sets: 4,
//                                reps: 12,
//                                restTime: 60,
//                                createdAt: "10.20.20",
//                                createdBy: "никита смирнов"),
//                            Exercise(
//                                id: 4,
//                                name: "Приседы",
//                                description: "Приседы епта",
//                                targetMuscle: ["Ягодицы", "Квадрицепс"],
//                                gymEquipment: ["Тренажер Смитта"],
//                                instructions: ["Подойдите к тренажеру", "Нажмите на кнопку начать", "Выполняйте", "Думайте о жизни"],
//                                preview: "",
//                                vidoe: "",
//                                sets: 4,
//                                reps: 12,
//                                restTime: 60,
//                                createdAt: "10.20.20",
//                                createdBy: "никита смирнов"),
//                            Exercise(
//                                id: 5,
//                                name: "Приседы",
//                                description: "Приседы епта",
//                                targetMuscle: ["Ягодицы", "Квадрицепс"],
//                                gymEquipment: ["Тренажер Смитта"],
//                                instructions: ["Подойдите к тренажеру", "Нажмите на кнопку начать", "Выполняйте", "Думайте о жизни"],
//                                preview: "",
//                                vidoe: "",
//                                sets: 4,
//                                reps: 12,
//                                restTime: 60,
//                                createdAt: "10.20.20",
//                                createdBy: "никита смирнов")
//                        ],
//            //            targetMuscles: [.shoulders],
//                        createdBy: "Николаев Роман",
//                        createdAt: "10.01.25"),
//                    Workout(
//                        id: 1,
//                        name: "Тренировка плеч 1",
//                        description: "Интенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого пояса",
//                        exercises: [
//                            Exercise(
//                                id: 6,
//                                name: "Приседы",
//                                description: "Приседы епта",
//                                targetMuscle: ["Ягодицы", "Квадрицепс"],
//                                gymEquipment: ["Тренажер Смитта"],
//                                instructions: ["Подойдите к тренажеру", "Нажмите на кнопку начать", "Выполняйте", "Думайте о жизни"],
//                                preview: "",
//                                vidoe: "",
//                                sets: 4,
//                                reps: 12,
//                                restTime: 60,
//                                createdAt: "10.20.20",
//                                createdBy: "никита смирнов"),
//                            Exercise(
//                                id: 7,
//                                name: "Приседы",
//                                description: "Приседы епта",
//                                targetMuscle: ["Ягодицы", "Квадрицепс"],
//                                gymEquipment: ["Тренажер Смитта"],
//                                instructions: ["Подойдите к тренажеру", "Нажмите на кнопку начать", "Выполняйте", "Думайте о жизни"],
//                                preview: "",
//                                vidoe: "",
//                                sets: 4,
//                                reps: 12,
//                                restTime: 60,
//                                createdAt: "10.20.20",
//                                createdBy: "никита смирнов"),
//                            Exercise(
//                                id: 8,
//                                name: "Приседы",
//                                description: "Приседы епта",
//                                targetMuscle: ["Ягодицы", "Квадрицепс"],
//                                gymEquipment: ["Тренажер Смитта"],
//                                instructions: ["Подойдите к тренажеру", "Нажмите на кнопку начать", "Выполняйте", "Думайте о жизни"],
//                                preview: "",
//                                vidoe: "",
//                                sets: 4,
//                                reps: 12,
//                                restTime: 60,
//                                createdAt: "10.20.20",
//                                createdBy: "никита смирнов")
//                        ],
//            //            targetMuscles: [.shoulders],
//                        createdBy: "Николаев Роман",
//                        createdAt: "10.01.25")
//                ],
//                .tuesday: [],
//                .wednesday: [],
//                .thursday: [],
//                .friday: [
//                    Workout(id: 1, name: "Тренировка плеч 1", description: "Интенсивная тренировка для развития плечевого пояса", createdBy: "Николаев Роман", createdAt: "10.01.25"),
//                ],
//                .saturday: [],
//                .sunday: []
//            ],
//            createdBy: "Николаев Роман",
//            createdAt: "10.01.25"),
//        lastSeenCard: Workout(
//            id: 1,
//            name: "Тренировка плеч 1op",
//            description: "Интенсивная тренировка для развития плечевого пояса",
//            exercises: [
//                Exercise(
//                    id: 0,
//                    name: "Приседы",
//                    description: "Приседы епта",
//                    targetMuscle: ["Ягодицы", "Квадрицепс"],
//                    gymEquipment: ["Тренажер Смитта"],
//                    instructions: ["Подойдите к тренажеру", "Нажмите на кнопку начать", "Выполняйте", "Думайте о жизни"],
//                    preview: "",
//                    vidoe: "",
//                    sets: 4,
//                    reps: 12,
//                    restTime: 60,
//                    createdAt: "10.20.20",
//                    createdBy: "никита смирнов"),
//                Exercise(
//                    id: 0,
//                    name: "Приседы",
//                    description: "Приседы епта",
//                    targetMuscle: ["Ягодицы", "Квадрицепс"],
//                    gymEquipment: ["Тренажер Смитта"],
//                    instructions: ["Подойдите к тренажеру", "Нажмите на кнопку начать", "Выполняйте", "Думайте о жизни"],
//                    preview: "",
//                    vidoe: "",
//                    sets: 4,
//                    reps: 12,
//                    restTime: 60,
//                    createdAt: "10.20.20",
//                    createdBy: "никита смирнов"),
//                Exercise(
//                    id: 0,
//                    name: "Приседы",
//                    description: "Приседы епта",
//                    targetMuscle: ["Ягодицы", "Квадрицепс"],
//                    gymEquipment: ["Тренажер Смитта"],
//                    instructions: ["Подойдите к тренажеру", "Нажмите на кнопку начать", "Выполняйте", "Думайте о жизни"],
//                    preview: "",
//                    vidoe: "",
//                    sets: 4,
//                    reps: 12,
//                    restTime: 60,
//                    createdAt: "10.20.20",
//                    createdBy: "никита смирнов"),
//            ],
////            targetMuscles: [.shoulders],
//            createdBy: "Николаев Роман",
//            createdAt: "10.01.25")
//    )
//}
