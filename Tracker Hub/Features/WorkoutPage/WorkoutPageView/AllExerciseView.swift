//
//  AllExerciseView.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 08.03.2025.
//

import SwiftUI

struct AllExerciseView: View {
    @StateObject var dataSource = DataSource()
    @State private var animationFuncs = CardAnimationFunc()
    @State private var allUserExercises: [Exercise] = [
        
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
    ]
    var body: some View {
        NavigationView {
            GeometryReader { globalGeo in
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(spacing: 20) {
                        ForEach(Array(allUserExercises.enumerated()), id: \.offset) { index, card in
                            GeometryReader { localGeo in
                                let frame = localGeo.frame(in: .global)
                                let screenHeight = UIScreen.main.bounds.height
                                
                                CardView(
                                    geometry: globalGeo,
                                    cardModel: card,
                                    onAdd: { print("Добавить упражнение") }) // Сделать пут запрос на добавление тренировки
                                    .scaleEffect(animationFuncs.scaleFactor(for: frame, screenHeight: screenHeight))
                                    .opacity(animationFuncs.opacity(for: frame, screenHeight: screenHeight))
                                    .offset(y: animationFuncs.offset(for: frame, screenHeight: screenHeight))
                                    .animation(.easeInOut(duration: 0.3), value: frame)
                            }
                            .frame(
                                width: globalGeo.size.width * 0.8,
                                height: globalGeo.size.height * 0.2)
                        }
                    }
                    .padding()
                }
                
            }
            .background(Color(dataSource.selectedTheme.backgroundColor))
            .navigationTitle("Ваши упражнения")
        }
    }
}

#Preview {
    AllExerciseView()
}

