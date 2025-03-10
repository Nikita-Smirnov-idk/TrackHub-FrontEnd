//
//  WorkoutFullScreenView.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 08.03.2025.
//

import SwiftUI

struct WorkoutFullScreenView: View {
    @StateObject private var dataSource = DataSource()
    var workout: Workout?
    
    @State private var isExpandedExrecises: Bool = true
    var body: some View {
//        NavigationView{
            GeometryReader { geometry in
                ZStack{
                    ScrollView(.vertical, showsIndicators: false){
                        
//                        let workout = workout ?? Workout(id: 2, name: "Нихуя", description: "не вышло", createdBy: "дура", createdAt: "10.01.25")
                        if let workout = workout{
                            
                            
                            VStack(alignment: .leading, spacing: 20) {
                                Text(workout.name)
                                    .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 28))
                                    .foregroundColor(Color(dataSource.selectedTheme.secondaryFontColor))
                                    .frame(alignment: .topLeading)
                                
                                
                                DisclosureGroup("Описание") {
                                    Text("\(workout.description)")
                                        .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 16))
                                        .multilineTextAlignment(.leading)
                                        .foregroundColor(Color(dataSource.selectedTheme.secondaryFontColor))
                                }
                                
                                Divider()
                                    .background(Color(dataSource.selectedTheme.primaryColor))
                                
                                DisclosureGroup("Упражнения", isExpanded: $isExpandedExrecises) {
                                    VStack(alignment: .leading){
                                        ForEach(workout.exercises, id: \.id){ exercise in
                                            CardView(geometry: geometry, cardModel: exercise)
                                        }
                                    }
                                    .padding()
                                }
                                
                                Divider()
                                    .background(Color(dataSource.selectedTheme.primaryColor))
                                
                                TagsView(tags: getTagsString(), geometry: geometry)
                                    .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.3, alignment: .top)
                            }
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
    
    private func getTagsString() -> [String] {
        var tags: [String] = []
        
        if let workout = workout{
            
            for exercise in workout.exercises {
                tags.append(contentsOf: exercise.gymEquipment)
                tags.append(contentsOf: exercise.targetMuscle)

            }
        }
        
        return tags
    }
}

//#Preview {
//    WorkoutFullScreenView(
//        workout: Workout(
//            id: 1,
//            name: "Тренировка плеч 1",
//            description: "Интенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого пояса",
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
//                    createdBy: "никита смирнов")
//            ],
////            targetMuscles: [.shoulders],
//            createdBy: "Николаев Роман",
//            createdAt: "10.01.25")
//    )
//}
