//
//  WorkoutPageView.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 04.03.2025.
//

import SwiftUI

struct WorkoutPageView: View {
    @StateObject var dataSource = DataSource()

    @State private var myWorkouts: [Workout] = [
        Workout(
            id: 1,
            name: "Тренировка плеч 1op",
            description: "Интенсивная тренировка для развития плечевого пояса",
            exercises: [
                Exercise(name: "Приседы", sets: 4, reps: 12, restTime: 60),
                Exercise(name: "Жимы", sets: 4, reps: 12, restTime: 60),
                Exercise(name: "Круг с ближним плечом", sets: 4, reps: 12, restTime: 60),
            ],
            targetMuscles: [.shoulders],
            createdBy: "Николаев Роман",
            createdAt: "10.01.25"),
        
        Workout(id: 2, name: "Тренировка плеч 2", description: "Интенсивная тренировка для развития плечевого пояса", createdBy: "Николаев Роман", createdAt: "10.01.25"),
        Workout(id: 3, name: "Тренировка плеч 3", description: "Интенсивная тренировка для развития плечевого пояса", createdBy: "Николаев Роман", createdAt: "10.01.25")
    ]
    
    @State private var myPlans: [Plan] = [
        Plan(id: 1, name: "Тренировка плеч", description: "Интенсивная тренировка для развития плечевого пояса", createdBy: "Николаев Роман", createdAt: "10.01.25"),
        Plan(id: 2, name: "План на неделю", description: "Фуллбоди программа", createdBy: "Николаев Роман", createdAt: "10.01.25")
    ]
    
    @State private var communityWorkouts: [any CardRepresentable] = [
        Workout(id: 4, name: "Тренировка плеч 4", description: "Интенсивная тренировка для развития плечевого пояса", createdBy: "Николаев Роман", createdAt: "10.01.25")
    ]
    @State private var favoriteWorkouts: [any CardRepresentable] = [
        Plan(id: 3, name: "План тренировки", description: "Фокус на грудные и плечи", createdBy: "Николаев Роман", createdAt: "10.01.25")
    ]
    
    // Категории, которые отображаются на экране
    private var categories: [String: [any CardRepresentable]] {
        [
            "Мои тренировки": myWorkouts,
            "Мои планы": myPlans,
            "Добавленные тренировки сообщества": communityWorkouts,
            "Избранные тренировки": favoriteWorkouts
        ]
    }
        
    let orderedCategories: [String] = [
        "Мои тренировки",
        "Мои планы",
        "Добавленные тренировки сообщества",
        "Избранные тренировки"
    ]
    
    @State private var isWorkoutConstructorVisible: Bool = false
    @State private var isPlanConstructorVisible: Bool = false
    
    @State private var isEditWorkoutVisible: Bool = false
    @State private var isEditPlanVisible: Bool = false
    
    @State private var currentWorkoutForEdit: Workout?
    @State private var currentWorkoutGroupForEdit: [Workout] = []
    
    @State private var currentPlanForEdit: Plan?
    @State private var currentPlanGroupForEdit: [Plan] = []
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .center, spacing: 15) {
                        ForEach(orderedCategories, id: \.self) { categoryKey in
                            if let items = categories[categoryKey], !items.isEmpty {
                                categorySection(for: categoryKey, items: items, geometry: geometry)
                            }
                        }
                    }
                }
                .padding()
            }
            .background(Color(dataSource.selectedTheme.backgroundColor))
            .navigationBarTitleDisplayMode(.inline) // Убирает большой заголовок
            .toolbar {
                ToolbarItem(placement: .principal) { // Размещает текст в центре
                    Text("Тренировки")
                        .font(.headline)
                        .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
                }
            }

            .navigationBarItems(
                trailing: Menu {
                    Button("Создать тренировку") { isWorkoutConstructorVisible.toggle() }
                    Button("Создать план") { isPlanConstructorVisible.toggle() }
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
                }
            )
            
            .sheet(isPresented: $isWorkoutConstructorVisible) {
                madeWorkout()
            }
            .sheet(isPresented: $isPlanConstructorVisible) {
                madePlan()
            }
            .sheet(isPresented: $isEditWorkoutVisible) {
                editWorkout()
            }
            .sheet(isPresented: $isEditPlanVisible) {
                editPlan()
            }
        }
    }
    
    // Раздел для категории
    private func categorySection(for categoryKey: String, items: [any CardRepresentable], geometry: GeometryProxy) -> some View {
        VStack(alignment: .leading) {
            Text(categoryKey)
                .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 21))
                .foregroundColor(Color(dataSource.selectedTheme.secondaryFontColor))
                .padding(.horizontal)
            
            TabView {
                ForEach(items, id: \.id) { item in
                    if let workout = item as? Workout {
                        CardView(
                            geometry: geometry,
                            cardModel: workout,
                            onEdit: {
                                currentWorkoutForEdit = workout
                                currentWorkoutGroupForEdit = categories[categoryKey] as! [Workout]
                                isEditWorkoutVisible.toggle()
                            }) // Сделать пут запрос на изменение тренировки
                            .padding(.vertical)

                            
                    } else if let plan = item as? Plan {
                        CardView(
                            geometry: geometry,
                            cardModel: plan,
                            onEdit: {
                                currentPlanForEdit = plan
                                currentPlanGroupForEdit = categories[categoryKey] as! [Plan]
                                isEditPlanVisible.toggle()
                            }) // Сделать пут запрос на изменение плана
                            .padding(.vertical)
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(width: geometry.size.width * 0.85, height: geometry.size.height * 0.25)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(dataSource.selectedTheme.secondaryBackgroundColor))
            )
            .clipped()
            .padding()
            
            
            Divider()
                .background(Color(dataSource.selectedTheme.primaryColor))
        }
    }
    
    private func editWorkout() -> some View {
        WorkoutConstuctorView(workout: $currentWorkoutForEdit, myWorkouts: $currentWorkoutGroupForEdit, isShowConstructot: $isEditWorkoutVisible)
            .presentationDetents([.large])
    }
    
    private func madeWorkout() -> some View {
        WorkoutConstuctorView(workout: .constant(nil), myWorkouts: $myWorkouts, isShowConstructot: $isWorkoutConstructorVisible)
            .presentationDetents([.large])
    }
    
    private func deleteWorkout() {
        
    }
    
    private func editPlan() -> some View {
        PlanConstructorView(plan: $currentPlanForEdit, isShowConstructot: $isEditPlanVisible, myPlans: $currentPlanGroupForEdit)
    }
    
    private func madePlan() -> some View {
        PlanConstructorView(plan: $currentPlanForEdit, isShowConstructot: $isPlanConstructorVisible, myPlans: $myPlans)
            .presentationDetents([.large])
    }
}

#Preview {
    WorkoutPageView()
}
