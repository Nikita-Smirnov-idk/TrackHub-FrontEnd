//
//  WorkoutFullScreenView.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 08.03.2025.
//

import SwiftUI

struct WorkoutFullScreenView: View {
    @StateObject private var dataSource = DataSource()
    var workout: Workout
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                ScrollView(.vertical, showsIndicators: false){
                    VStack(alignment: .leading, spacing: 20) {
                        Text(workout.name)
                            .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 28))
                            .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
                            .frame(alignment: .topLeading)
                        
                        
                        
                        Text("Описание: \(workout.description)")
                            .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 16))
                            .foregroundColor(Color(dataSource.selectedTheme.secondaryFontColor))
                            .frame(alignment: .center)
                        
                        Divider()
                            .background(Color(dataSource.selectedTheme.primaryColor))

                        
                        VStack {
                            Text("Группы мышщ")
                                .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 20))
                                .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
                                .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height * 0.25, alignment: .topLeading)
                            
                            let muscles = workout.targetMuscles
                            ForEach(muscles, id: \.self){ targetMuscle in
                                HStack {
                                    Spacer()
                                    
                                    Text(targetMuscle.rawValue)
                                        .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 16))
                                        .foregroundColor(Color(dataSource.selectedTheme.secondaryFontColor))
                                        .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height * 0.25, alignment: .topLeading)
                                }
                            }
                            
                            Divider()
                                .background(Color(dataSource.selectedTheme.primaryColor))
                        }
                        
                        ForEach(workout.exercises, id: \.id){ exercise in
                            VStack {
                                Text(exercise.name)
                                    .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 20))
                                    .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
                                    .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height * 0.25, alignment: .topLeading)
                                
                                
                                HStack {
                                    Spacer()
                                    
                                    VStack(alignment: .leading){
                                        Text("Подходов: \(exercise.sets)")
                                            .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 16))
                                            .foregroundColor(Color(dataSource.selectedTheme.secondaryFontColor))
                                            .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height * 0.25, alignment: .topLeading)
                                        
                                        Text("Повторений: \(exercise.reps)")
                                            .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 16))
                                            .foregroundColor(Color(dataSource.selectedTheme.secondaryFontColor))
                                            .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height * 0.25, alignment: .topLeading)
                                        
                                        Text("Время отдыха (мин): \(exercise.restTime)").font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 16))
                                            .foregroundColor(Color(dataSource.selectedTheme.secondaryFontColor))
                                            .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height * 0.25, alignment: .topLeading)
                                    }
                                }
                                
                                Divider()
                                    .background(Color(dataSource.selectedTheme.primaryColor))
                            }
                        }
                    }
                }
                .padding()
                
                HStack(alignment: .center, spacing: 60) {
                    Image(systemName: "arrowshape.turn.up.backward")
                        .resizable()
                        .foregroundStyle(Color(dataSource.selectedTheme.primaryColor))
                        .frame(width: geometry.size.width * 0.07, height: geometry.size.width * 0.07)
                    
                    Image(systemName: "plus.circle")
                        .resizable()
                        .foregroundStyle(Color(dataSource.selectedTheme.primaryColor))
                        .frame(width: geometry.size.width * 0.12, height: geometry.size.width * 0.12)
                    
                    Image(systemName: "star")
                        .resizable()
                        .foregroundStyle(Color(dataSource.selectedTheme.primaryColor))
                        .frame(width: geometry.size.width * 0.07, height: geometry.size.width * 0.07)
                }
                .frame(width: geometry.size.width * 0.8, height: geometry.size.width * 0.15, alignment: .center)
                .background(.thinMaterial) // системный материал с эффектом размытия
                .clipShape(RoundedRectangle(cornerRadius: 10)) // скругленные углы для красоты
                .shadow(color: Color.black.opacity(0.5), radius: 4, x: 0, y: 2)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            }
        }
        .background(Color(dataSource.selectedTheme.backgroundColor))
    }
}

#Preview {
    WorkoutFullScreenView(
        workout: Workout(
            id: 1,
            name: "Тренировка плеч 1",
            description: "Интенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого поясаИнтенсивная тренировка для развития плечевого пояса",
            exercises: [
                Exercise(id: 0, name: "Приседы", sets: 4, reps: 12, restTime: 60),
                Exercise(id: 1, name: "Жимы", sets: 4, reps: 12, restTime: 60),
                Exercise(id: 2, name: "Круг с ближним плечом", sets: 4, reps: 12, restTime: 60),
            ],
            targetMuscles: [.shoulders],
            createdBy: "Николаев Роман",
            createdAt: "10.01.25")
    )
}
