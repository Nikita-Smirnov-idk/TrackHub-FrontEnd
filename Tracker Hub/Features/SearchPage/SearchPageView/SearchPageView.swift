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
    @State private var isFilterShow: Bool = false
    @State private var animationFuncs = CardAnimationFunc()
    var allWorkoutsAndPlans: [any CardRepresentable] = [
        Workout(id: 0, name: "Тренировка ног", description: "cscscscscs", createdBy: "Николаев Роман", createdAt: "10.10.20"),
        Plan(id: 1, name: "Тренировка ног", description: "cscscscscs", createdBy: "Николаев Роман", createdAt: "10.10.20"),
        Workout(id: 2, name: "Тренировка ног", description: "cscscscscs", createdBy: "Николаев Роман", createdAt: "10.10.20"),
        Plan(id: 3, name: "Тренировка ног", description: "cscscscscs", createdBy: "Николаев Роман", createdAt: "10.10.20"),
        Workout(id: 4, name: "Тренировка ног", description: "cscscscscs", createdBy: "Николаев Роман", createdAt: "10.10.20"),
        Plan(id: 5, name: "Тренировка ног", description: "cscscscscs", createdBy: "Николаев Роман", createdAt: "10.10.20"),
        Workout(id: 6, name: "Тренировка ног", description: "cscscscscs", createdBy: "Николаев Роман", createdAt: "10.10.20"),
        Plan(id: 7, name: "Тренировка ног", description: "cscscscscs", createdBy: "Николаев Роман", createdAt: "10.10.20")
    ]
    
    @State private var isShowFullScreenCardView: Bool = false
    @State private var currentCard: Workout?
    var body: some View {
        GeometryReader { globalGeo in
            ZStack { // Используем ZStack вместо VStack для слоев
                // Основной фон экрана
                Color(dataSource.selectedTheme.backgroundColor)
                    .ignoresSafeArea()
                
                VStack {
                    SearchBarView(isFilterShow: $isFilterShow, geometry: globalGeo)
                    
                    ScrollView {
                        LazyVStack(spacing: 20) {
                            ForEach(allWorkoutsAndPlans, id: \.id) { card in
                                GeometryReader { localGeo in
                                    let frame = localGeo.frame(in: .global)
                                    let screenHeight = UIScreen.main.bounds.height
                                    
                                    if let workout = card as? Workout {
                                        CardView(
                                            geometry: globalGeo,
                                            cardModel: workout,
                                            onAdd: { print("Тренировка добавлена") },
                                            onTap: {  }) // Сделать пут запрос с добавлением тренировки
                                            .scaleEffect(animationFuncs.scaleFactor(for: frame, screenHeight: screenHeight))
                                            .opacity(animationFuncs.opacity(for: frame, screenHeight: screenHeight))
                                            .offset(y: animationFuncs.offset(for: frame, screenHeight: screenHeight))
                                            .animation(.easeInOut(duration: 0.3), value: frame)
                                            
                                    }
                                    else if let plan = card as? Plan {
                                        CardView(
                                            geometry: globalGeo,
                                            cardModel: plan,
                                            onAdd: { print("План добавлен") }) // Сделать пут запрос с добавлением плана
                                            .scaleEffect(animationFuncs.scaleFactor(for: frame, screenHeight: screenHeight))
                                            .opacity(animationFuncs.opacity(for: frame, screenHeight: screenHeight))
                                            .offset(y: animationFuncs.offset(for: frame, screenHeight: screenHeight))
                                            .animation(.easeInOut(duration: 0.3), value: frame)
                                    }
                                    
                                }
                                .frame(
                                    width: globalGeo.size.width * 0.8,
                                    height: globalGeo.size.height * 0.2)
                            }
                        }
                        .padding()
                    }
                    .scrollIndicators(.hidden)
                }
            }
            .sheet(isPresented: $isFilterShow) {
                FiltersSheetView(geometry: globalGeo)
                    .presentationDetents([.medium, .large])
                    .presentationDragIndicator(.visible)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}



#Preview {
    SearchPageView().environmentObject(DataSource())
}
