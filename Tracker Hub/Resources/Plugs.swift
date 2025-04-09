//
//  Plugs.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 10.03.2025.
//

import Foundation

// MARK: - Структура Plugs с заглушками

struct Plugs {
    // Пользователи
    static let romanNikolaev = User(
        id: 1,
        email: "roman.nikolaev@example.com",
        password: "",
        phoneNumber: "",
        isMale: true,
        isTrener: false,
        avatar: "https://example.com/avatar1.png",
        name: "Роман",
        surname: "Николаев",
        notifications: [],
        rating: 4.5
    )
    
    static let nikitaSmirnov = User(
        id: 2,
        email: "nikita.smirnov@example.com",
        password: "",
        phoneNumber: "",
        isMale: true,
        isTrener: false,
        avatar: "https://example.com/avatar2.png",
        name: "Никита",
        surname: "Смирнов",
        notifications: [],
        rating: 4.2
    )
    
    static let ivanKonovalov = User(
        id: 3,
        email: "ivan.konovalov@example.com",
        password: "",
        phoneNumber: "",
        isMale: true,
        isTrener: false,
        avatar: "https://example.com/avatar3.png",
        name: "Иван",
        surname: "Коновалов",
        notifications: [],
        rating: 4.7
    )
    
    // Упражнения
    static let exercise1 = Exercise(
        id: 101,
        name: "Приседания со штангой",
        description: "Классические приседания для ног и ягодиц.",
        targetMuscle: ["Ягодицы", "Квадрицепсы"],
        gymEquipment: ["Штанга", "Стойка"],
        instructions: [
            "Ставьте ноги на ширине плеч.",
            "Опускайтесь до параллели бедер с полом.",
            "Поднимайтесь, сохраняя прямую спину."
        ],
        preview: "https://example.com/exercise1.jpg",
        vidoe: "https://example.com/exercise1.mp4",
        sets: 3,
        reps: 12,
        restTime: 90,
        createdAt: "2025-03-10T10:00:00Z",
        createdBy: romanNikolaev,
        cardType: .exercise
    )
    
    static let exercise2 = Exercise(
        id: 102,
        name: "Отжимания на брусьях",
        description: "Отжимания для грудных мышц и трицепсов.",
        targetMuscle: ["Грудные мышцы", "Трицепсы"],
        gymEquipment: ["Брусья"],
        instructions: [
            "Держитесь за брусья.",
            "Опускайтесь до угла 90° в локтях.",
            "Поднимайтесь, полностью выпрямляя руки."
        ],
        preview: "https://example.com/exercise2.jpg",
        vidoe: "https://example.com/exercise2.mp4",
        sets: 4,
        reps: 10,
        restTime: 60,
        createdAt: "2025-03-10T11:00:00Z",
        createdBy: nikitaSmirnov,
        cardType: .exercise
    )
    
    static let exercise3 = Exercise(
        id: 103,
        name: "Подтягивания",
        description: "Подтягивания для развития широчайших мышц спины.",
        targetMuscle: ["Спина", "Бицепсы"],
        gymEquipment: ["Турник"],
        instructions: [
            "Возьмитесь за перекладину.",
            "Подтягивайтесь до уровня подбородка.",
            "Опускайтесь медленно и контролируемо."
        ],
        preview: "https://example.com/exercise3.jpg",
        vidoe: "https://example.com/exercise3.mp4",
        sets: 3,
        reps: 8,
        restTime: 90,
        createdAt: "2025-03-10T12:00:00Z",
        createdBy: ivanKonovalov,
        cardType: .exercise
    )
    
    static let exercise4 = Exercise(
        id: 104,
        name: "Жим штанги лежа",
        description: "Жим штанги для тренировки грудных мышц.",
        targetMuscle: ["Грудные мышцы", "Плечи", "Трицепсы"],
        gymEquipment: ["Штанга", "Лавка"],
        instructions: [
            "Лягте на скамью.",
            "Возьмитесь за штангу на ширине плеч.",
            "Опустите штангу к груди и выжмите вверх."
        ],
        preview: "https://example.com/exercise4.jpg",
        vidoe: "https://example.com/exercise4.mp4",
        sets: 4,
        reps: 10,
        restTime: 120,
        createdAt: "2025-03-10T13:00:00Z",
        createdBy: romanNikolaev,
        cardType: .exercise
    )
    
    static let exercise5 = Exercise(
        id: 105,
        name: "Планка",
        description: "Упражнение для укрепления кора.",
        targetMuscle: ["Пресс", "Спина"],
        gymEquipment: ["Коврик"],
        instructions: [
            "Примите упор лёжа на предплечьях.",
            "Держите тело прямым от головы до пят.",
            "Задержитесь максимально долго."
        ],
        preview: "https://example.com/exercise5.jpg",
        vidoe: "https://example.com/exercise5.mp4",
        sets: 3,
        reps: 1,
        restTime: 60,
        createdAt: "2025-03-10T14:00:00Z",
        createdBy: nikitaSmirnov,
        cardType: .exercise
    )
    
    static let exercise6 = Exercise(
        id: 106,
        name: "Становая тяга",
        description: "Становая тяга для развития силы спины и ног.",
        targetMuscle: ["Спина", "Ягодицы", "Ноги"],
        gymEquipment: ["Штанга"],
        instructions: [
            "Ставьте ноги на ширине плеч.",
            "Опуститесь и возьмитесь за штангу.",
            "Поднимитесь, держа спину прямой, и опуститесь обратно."
        ],
        preview: "https://example.com/exercise6.jpg",
        vidoe: "https://example.com/exercise6.mp4",
        sets: 4,
        reps: 8,
        restTime: 120,
        createdAt: "2025-03-10T15:00:00Z",
        createdBy: ivanKonovalov,
        cardType: .exercise
    )
    
    static let allExercises: [Exercise] = [
        exercise1, exercise2, exercise3, exercise4, exercise5, exercise6
    ]
    
    // Тренировки
    static let workout1 = Workout(
        id: 201,
        name: "Сила и выносливость",
        description: "Комплекс для развития силы и выносливости.",
        exercises: [exercise1, exercise3, exercise6],
        createdBy: romanNikolaev,
        createdAt: "2025-03-11T08:00:00Z",
        cardType: .workout
    )
    
    static let workout2 = Workout(
        id: 202,
        name: "Грудной комплекс",
        description: "Тренировка для улучшения формы грудных мышц.",
        exercises: [exercise2, exercise4],
        createdBy: nikitaSmirnov,
        createdAt: "2025-03-11T06:30:00Z",
        cardType: .workout
    )
    
    static let workout3 = Workout(
        id: 203,
        name: "Упражнения на кор",
        description: "Комплекс для пресса и спины.",
        exercises: [exercise5],
        createdBy: ivanKonovalov,
        createdAt: "2025-03-11T07:15:00Z",
        cardType: .workout
    )
    
    static let workout4 = Workout(
        id: 204,
        name: "Полный комплекс",
        description: "Смешанная тренировка для всего тела.",
        exercises: [exercise1, exercise2, exercise3, exercise4, exercise5, exercise6],
        createdBy: romanNikolaev,
        createdAt: "2025-03-11T09:00:00Z",
        cardType: .workout
    )
    
    static let allWorkouts: [Workout] = [
        workout1, workout2, workout3, workout4
    ]
    
    // Планы
    static let plan1 = Plan(
        id: 301,
        name: "План для начинающих",
        description: "Простой план для тех, кто только начинает тренироваться.",
        schedule: [
            .monday: [workout1],
            .wednesday: [workout2],
            .friday: [workout3]
        ],
        createdBy: nikitaSmirnov,
        createdAt: "2025-03-12T09:00:00Z",
        cardType: .plan
    )
    
    static let plan2 = Plan(
        id: 302,
        name: "Интенсивный план",
        description: "План для опытных спортсменов с высокой нагрузкой.",
        schedule: [
            .tuesday: [workout2, workout4],
            .thursday: [workout1, workout4],
            .saturday: [workout3, workout4]
        ],
        createdBy: ivanKonovalov,
        createdAt: "2025-03-12T10:00:00Z",
        cardType: .plan
    )
    
    static let plan3 = Plan(
        id: 303,
        name: "Баланс и гибкость",
        description: "План для улучшения баланса и гибкости.",
        schedule: [
            .monday: [workout3],
            .wednesday: [workout3],
            .friday: [workout3]
        ],
        createdBy: romanNikolaev,
        createdAt: "2025-03-12T11:00:00Z",
        cardType: .plan
    )
    
    static let plan4 = Plan(
        id: 304,
        name: "Комплекс для всего тела",
        description: "Смешанный план с силовыми и функциональными упражнениями.",
        schedule: [
            .monday: [workout4],
            .tuesday: [workout2],
            .thursday: [workout1],
            .sunday: [workout4]
        ],
        createdBy: nikitaSmirnov,
        createdAt: "2025-03-12T12:00:00Z",
        cardType: .plan
    )
    
    static let plan5 = Plan(
        id: 305,
        name: "Профессиональный режим",
        description: "План для продвинутых атлетов с высокой нагрузкой.",
        schedule: [
            .monday: [workout4],
            .wednesday: [workout4],
            .friday: [workout4],
            .saturday: [workout2, workout3]
        ],
        createdBy: ivanKonovalov,
        createdAt: "2025-03-12T13:00:00Z",
        cardType: .plan
    )
    
    static let plan6 = Plan(
        id: 306,
        name: "Комбинированный план",
        description: "План, сочетающий силовые, кардио и функциональные тренировки.",
        schedule: [
            .tuesday: [workout2],
            .thursday: [workout1, workout3],
            .sunday: [workout4]
        ],
        createdBy: romanNikolaev,
        createdAt: "2025-03-12T14:00:00Z",
        cardType: .plan
    )
    
    static let allPlans: [Plan] = [
        plan1, plan2, plan3, plan4, plan5, plan6
    ]
}
