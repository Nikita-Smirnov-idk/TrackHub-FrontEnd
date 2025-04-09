//
//  PlanFullScreenView.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 08.03.2025.
//

import SwiftUI

struct PlanFullScreenView: View {
    @StateObject private var dataSource = DataSource()
    var plan: Plan
    
    @State private var isExpandedWorkouts: Bool = true
    @State private var currentSelectedDay: DayOfWeek = .monday
    var body: some View {
//        NavigationView{
            GeometryReader { geometry in
                ZStack{
                    ScrollView(.vertical, showsIndicators: false){
                        VStack(alignment: .leading, spacing: 20) {
                            Text(plan.name)
                                .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 28))
                                .foregroundColor(Color(dataSource.selectedTheme.secondaryFontColor))
                                .frame(alignment: .topLeading)
                            
                            
                            DisclosureGroup("Описание") {
                                Text("\(plan.description)")
                                    .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 16))
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(Color(dataSource.selectedTheme.secondaryFontColor))
                            }
                            
                            
                            DisclosureGroup("Тренировки", isExpanded: $isExpandedWorkouts) {
                                HStack(alignment: .center, spacing: 30){
                                    ForEach(DayOfWeek.allCases, id: \.self) { day in
                                        Text(day.rawValue)
                                            .font(Font.custom(Fonts.ReadexPro_Medium.rawValue, size: 16))
                                            .background {
                                                Circle()
                                                    .fill(day == currentSelectedDay ?
                                                          Color(dataSource.selectedTheme.primaryColor) :
                                                            Color(dataSource.selectedTheme.buttonsBackgroundColor))
                                                    .frame(width: geometry.size.width * 0.1, height: geometry.size.width * 0.1)
                                            }
                                            .foregroundColor(day == currentSelectedDay ?
                                                             Color(dataSource.selectedTheme.buttonsBackgroundColor) :
                                                                Color(dataSource.selectedTheme.primaryColor))
                                            .onTapGesture {
                                                withAnimation {
                                                    currentSelectedDay = day
                                                }
                                            }
                                    }
                                }
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding()
                                
                                if (plan.schedule[currentSelectedDay] ?? []).count > 0{
                                    ForEach(plan.schedule[currentSelectedDay] ?? [], id: \.self){ workout in
                                        CardView(geometry: geometry, cardModel: workout)
                                    }
                                }
                            }
                            
                            Divider()
                                .background(Color(dataSource.selectedTheme.primaryColor))
                            
                            TagsView(tags: getTagsString(), geometry: geometry)
                                .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.3)
                        }
                    }
                    .padding()
                    
                    CardFullScreenButton(dataSource: dataSource, geometry: geometry)
                }
            }
            .background(Color(dataSource.selectedTheme.backgroundColor))
            .accentColor(Color(dataSource.selectedTheme.primaryColor))
//        }
        
        
        
    }
    
    private func getTagsString() -> [String]{
        var tags: [String] = []
        
        for pair in plan.schedule {
            let workouts: [Workout] = pair.value
            
            for workout in workouts {
                for exercise in workout.exercises {
                    tags.append(contentsOf: exercise.gymEquipment)
                    tags.append(contentsOf: exercise.targetMuscle)
                }
            }
        }
        
        return tags
    }
}

//#Preview {
//    PlanFullScreenView(
//        plan: Plan(
//            id: 1,
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
//            createdAt: "10.01.25")
//    )
//}
//
