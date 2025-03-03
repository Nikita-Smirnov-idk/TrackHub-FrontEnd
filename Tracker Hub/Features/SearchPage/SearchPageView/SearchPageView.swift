//
//  SearchPageView.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 03.03.2025.
//

import SwiftUI

struct SearchPageView: View {
    @EnvironmentObject var dataSource : DataSource
    
    @State private var isAnimated = false
            
    var allWorkoutsAndPlans: [WorkoutCardModel] = [
        WorkoutCardModel(
            name: "Тренировка плеч",
            description: "Самая пиздатая тренировк плеч. Вы ахуеете",
            isWorkout: true,
            createdBy: "Никита Смирнов",
            createdAt: "10.01.25"),
        WorkoutCardModel(
            name: "Тренировка плеч",
            description: "Самая пиздатая тренировк плеч. Вы ахуеете",
            isWorkout: true,
            createdBy: "Коновалов Иван",
            createdAt: "10.01.25"),
        WorkoutCardModel(
            name: "Тренировка плеч",
            description: "Самая пиздатая тренировк плеч. Вы ахуеете",
            isWorkout: true,
            createdBy: "Воронин Глеб",
            createdAt: "10.01.25"),
        WorkoutCardModel(
            name: "Тренировка плеч",
            description: "Самая пиздатая тренировк плеч. Вы ахуеете",
            isWorkout: true,
            createdBy: "Ковальчук Артем",
            createdAt: "10.01.25"),
        WorkoutCardModel(
            name: "Тренировка плеч",
            description: "Самая пиздатая тренировк плеч. Вы ахуеете",
            isWorkout: true,
            createdBy: "Николаев Роман",
            createdAt: "10.01.25"),
        WorkoutCardModel(
            name: "Тренировка плеч",
            description: "Самая пиздатая тренировк плеч. Вы ахуеете",
            isWorkout: true,
            createdBy: "Николаев Роман",
            createdAt: "10.01.25"),
        WorkoutCardModel(
            name: "Тренировка плеч",
            description: "Самая пиздатая тренировк плеч. Вы ахуеете",
            isWorkout: true,
            createdBy: "Николаев Роман",
            createdAt: "10.01.25"),
        WorkoutCardModel(
            name: "Тренировка плеч",
            description: "Самая пиздатая тренировк плеч. Вы ахуеете",
            isWorkout: true,
            createdBy: "Николаев Роман",
            createdAt: "10.01.25"),
        WorkoutCardModel(
            name: "Тренировка плеч",
            description: "Самая пиздатая тренировк плеч. Вы ахуеете",
            isWorkout: true,
            createdBy: "Николаев Роман",
            createdAt: "10.01.25"),
        WorkoutCardModel(
            name: "Тренировка плеч",
            description: "Самая пиздатая тренировк плеч. Вы ахуеете",
            isWorkout: true,
            createdBy: "Николаев Роман",
            createdAt: "10.01.25"),
        WorkoutCardModel(
            name: "Тренировка плеч",
            description: "Самая пиздатая тренировк плеч. Вы ахуеете",
            isWorkout: true,
            createdBy: "Николаев Роман",
            createdAt: "10.01.25")
    ]
    
    var body: some View {
        GeometryReader { globalGeo in
            VStack{
                SearchBarView(geometry: globalGeo)
                ScrollView {
                    LazyVStack(spacing: 20) {
                        ForEach(Array(allWorkoutsAndPlans.enumerated()), id: \.offset) { index, card in
                            GeometryReader { localGeo in
                                let frame = localGeo.frame(in: .global)
                                let screenHeight = UIScreen.main.bounds.height
                                
                                WorkoutCardView(geometry: globalGeo, cardModel: card)
                                    .scaleEffect(scaleFactor(for: frame, screenHeight: screenHeight))
                                    .opacity(opacity(for: frame, screenHeight: screenHeight))
                                    .offset(y: offset(for: frame, screenHeight: screenHeight))
                                    .animation(.easeInOut(duration: 0.3), value: frame)
                            }
                            .frame(height: globalGeo.size.height * 0.2)
                        }
                    }
                    .padding()
                }
                .scrollIndicators(.hidden)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(dataSource.selectedTheme.backgroundColor))
    }
    
    
    // Вычисление масштаба
        private func scaleFactor(for frame: CGRect, screenHeight: CGFloat) -> CGFloat {
            let threshold: CGFloat = 150
            
            // Нижняя зона: когда карточка появляется снизу
            if frame.minY >= screenHeight - threshold {
                let effect = min((frame.minY - (screenHeight - threshold)) / threshold, 1.0)
                return 1.0 - effect * 0.2  // уменьшается до 0.8 при максимальном эффекте
            }
            // Верхняя зона: когда карточка уходит сверху
            if frame.minY <= threshold {
                let effect = min((threshold - frame.minY) / threshold, 1.0)
                return 1.0 - effect * 0.2
            }
            return 1.0 // центральная область – без эффекта
        }
        
        // Вычисление прозрачности
        private func opacity(for frame: CGRect, screenHeight: CGFloat) -> Double {
            let threshold: CGFloat = 150
            
            if frame.minY >= screenHeight - threshold {
                let effect = min((frame.minY - (screenHeight - threshold)) / threshold, 1.0)
                return 1.0 - Double(effect) * 0.5  // opacity снижается до 0.5
            }
            if frame.minY <= threshold {
                let effect = min((threshold - frame.minY) / threshold, 1.0)
                return 1.0 - Double(effect) * 0.5
            }
            return 1.0
        }
        
        // Вычисление вертикального смещения для эффекта параллакса
        private func offset(for frame: CGRect, screenHeight: CGFloat) -> CGFloat {
            let threshold: CGFloat = 150
            
            if frame.minY >= screenHeight - threshold {
                let effect = min((frame.minY - (screenHeight - threshold)) / threshold, 1.0)
                return effect * 30  // смещение вниз до 30 поинтов
            }
            if frame.minY <= threshold {
                let effect = min((threshold - frame.minY) / threshold, 1.0)
                return -effect * 30  // смещение вверх до -30 поинтов
            }
            return 0
        }
}

#Preview {
    SearchPageView().environmentObject(DataSource())
}
