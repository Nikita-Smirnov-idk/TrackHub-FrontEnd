//
//  WorkoutPageView.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 04.03.2025.
//

import SwiftUI

struct WorkoutsGroupView: View {
    @StateObject var dataSource = DataSource()
    @StateObject var viewModel = WorkoutPageViewModel()
    
    @State private var workoutGroup: [Workout] = Plugs.allWorkouts
    @State private var planGroup: [Plan] = Plugs.allPlans
    
    @State private var exerciseGroup: [Exercise] = Plugs.allExercises
    
    // Категории, которые отображаются на экране
    private var categories: [String: [any CardRepresentable]] {
        [
            "Упражнения": exerciseGroup,
            "Тренировки": workoutGroup,
            "Планы": planGroup,
        ]
    }
        
    let orderedCategories: [String] = [
        "Упражнения",
        "Тренировки",
        "Планы"
    ]
    
    var categoryName: String
    
    @State private var isWorkoutConstructorVisible: Bool = false
    @State private var isPlanConstructorVisible: Bool = false
    @State private var isExerciseConstructorVisible: Bool = false
    
    @State private var isEditWorkoutVisible: Bool = false
    @State private var isEditPlanVisible: Bool = false
    @State private var isEditExerciseVisible: Bool = false
    
    @State private var currentWorkoutForEdit: Workout?
    @State private var currentWorkoutGroupForEdit: [Workout] = []
    
    @State private var currentPlanForEdit: Plan?
    @State private var currentPlanGroupForEdit: [Plan] = []
    
    @State private var currentExerciseForEdit: Exercise?
    @State private var currentExerciseGroupForEdit: [Exercise] = []
    
    var body: some View {
//        NavigationView {
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
                .onAppear {
                    viewModel.getWorkout(workoutId: 1)
                    viewModel.getPlan(planId: 1)
                    viewModel.getAllUsersExercise()
                }
            }
            .background(Color(dataSource.selectedTheme.backgroundColor))
            .navigationTitle(categoryName)
            .navigationBarItems(
                trailing: Menu {
                    Button("Создать тренировку") { isWorkoutConstructorVisible.toggle() }
                    Button("Создать план") { isPlanConstructorVisible.toggle() }
                    Button("Создать упражнение") { isExerciseConstructorVisible.toggle() }
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
            .sheet(isPresented: $isEditExerciseVisible) {
                editExercise()
            }
            .sheet(isPresented: $isExerciseConstructorVisible) {
                madeExercise()
            }
            .accentColor(Color(dataSource.selectedTheme.primaryColor))
        
    }
    
    // Раздел для категории
    private func categorySection(for categoryKey: String, items: [any CardRepresentable], geometry: GeometryProxy) -> some View {
        VStack(alignment: .leading) {
            Text(categoryKey)
                .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 22))
                .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
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
                            }
                        )
                        .padding(.vertical)
                        

                    } else if let plan = item as? Plan {
                        NavigationLink(destination: PlanFullScreenView(plan: plan)) {
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
                        
                    } else if let exercise = item as? Exercise {
                        NavigationLink(destination: ExerciseFullScreenView(exercise: exercise)) {
                            CardView(
                                geometry: geometry,
                                cardModel: exercise,
                                onEdit: {
                                    currentExerciseForEdit = exercise
                                    currentExerciseGroupForEdit = categories[categoryKey] as! [Exercise]
                                    isEditExerciseVisible.toggle()
                                })
                            .padding(.vertical)
                        }
                    }
                    
                }
            }
            .accentColor(Color(dataSource.selectedTheme.primaryColor))
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
        WorkoutConstuctorView(workout: .constant(nil), myWorkouts: $workoutGroup, isShowConstructot: $isWorkoutConstructorVisible)
            .presentationDetents([.large])
    }
    
    private func deleteWorkout() {
        
    }
    
    private func editPlan() -> some View {
        PlanConstructorView(plan: $currentPlanForEdit, isShowConstructot: $isEditPlanVisible, myPlans: $currentPlanGroupForEdit)
    }
    
    private func madePlan() -> some View {
        PlanConstructorView(plan: .constant(nil), isShowConstructot: $isPlanConstructorVisible, myPlans: $planGroup)
            .presentationDetents([.large])
    }
    
    private func deletePlan() {
        
    }
    
    private func editExercise() -> some View {
        ExerciseConstructorView(selectedExersiceGroup: $exerciseGroup, isShowConstructor: $isEditExerciseVisible, exercise: $currentExerciseForEdit)
    }
    
    private func madeExercise() -> some View {
        ExerciseConstructorView(selectedExersiceGroup: $exerciseGroup, isShowConstructor: $isExerciseConstructorVisible, exercise: .constant(nil))
    }
    
    private func deleteExercise() {
        
    }
}

#Preview {
    WorkoutsGroupView(categoryName: "Мои")
}
