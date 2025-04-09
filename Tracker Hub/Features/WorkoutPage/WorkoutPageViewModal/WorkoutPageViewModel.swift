//
//  WorkoutPageViewModel.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 10.03.2025.
//

import Foundation
import SwiftKeychainWrapper
import Combine

class WorkoutPageViewModel: ObservableObject {
    // Публикуемые свойства для каждого типа данных
    @Published var exerciseData: Exercise?
    @Published var workoutData: Workout?
    @Published var planData: Plan?
    
    // MARK: - Методы для Упражнения
    
    /// GET упражнение по id (принимаем id как Int)
    func getExerciseById(exerciseId: Int) {
        let urlString = "http://127.0.0.1:8000/exercises/\(exerciseId)/"
        APIService.shared.request(urlString: urlString, method: "GET", requiresAuth: true) { (result: Result<Exercise, Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let exercise):
                    self.exerciseData = exercise
                    print("Упражнение получено: \(exercise.name)")
                case .failure(let error):
                    print("Ошибка получения упражнения: \(error.localizedDescription)")
                }
            }
        }
    }
    
    func getAllUsersExercise() {
        let urlString = "http://127.0.0.1:8000/exercises/"
        APIService.shared.request(urlString: urlString, method: "GET", requiresAuth: true) { (result: Result<Exercise, Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let exercise):
                    self.exerciseData = exercise
                    print("Упражнения получено: \(exercise.name)")
                case .failure(let error):
                    print("Ошибка получения упражнения: \(error.localizedDescription)")
                }
            }
        }
    }
    
    /// POST новое упражнение
    func postExercise(exercise: Exercise, completion: @escaping (Result<Exercise, Error>) -> Void) {
        let urlString = "http://127.0.0.1:8000/exercises/"
        guard let bodyData = try? JSONEncoder().encode(exercise) else {
            completion(.failure(APIError.noData))
            return
        }
        APIService.shared.request(urlString: urlString, method: "POST", body: bodyData, requiresAuth: true) { (result: Result<Exercise, Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let exercise):
                    self.exerciseData = exercise
                    print("Упражнение создано: \(exercise.name)")
                    completion(.success(exercise))
                case .failure(let error):
                    print("Ошибка создания упражнения: \(error.localizedDescription)")
                    completion(.failure(error))
                }
            }
        }
    }
    
    // MARK: - Методы для Тренировки (Workout)
    
    /// GET тренировка по id
    func getWorkout(workoutId: Int) {
        let urlString = "http://127.0.0.1:8000/workouts/\(workoutId)/"
        APIService.shared.request(urlString: urlString, method: "GET", requiresAuth: true) { (result: Result<Workout, Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let workout):
                    self.workoutData = workout
                    print("Тренировка получена: \(workout.name)")
                case .failure(let error):
                    print("Ошибка получения тренировки: \(error.localizedDescription)")
                }
            }
        }
    }
    
    /// POST новая тренировка
    func postWorkout(workout: Workout, completion: @escaping (Result<Workout, Error>) -> Void) {
        let urlString = "http://127.0.0.1:8000/workouts/"
        guard let bodyData = try? JSONEncoder().encode(workout) else {
            completion(.failure(APIError.noData))
            return
        }
        APIService.shared.request(urlString: urlString, method: "POST", body: bodyData, requiresAuth: true) { (result: Result<Workout, Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let workout):
                    self.workoutData = workout
                    print("Тренировка создана: \(workout.name)")
                    completion(.success(workout))
                case .failure(let error):
                    print("Ошибка создания тренировки: \(error.localizedDescription)")
                    completion(.failure(error))
                }
            }
        }
    }
    
    // MARK: - Методы для Плана
    
    /// GET план по id
    func getPlan(planId: Int) {
        let urlString = "http://127.0.0.1:8000/plans/\(planId)/"
        APIService.shared.request(urlString: urlString, method: "GET", requiresAuth: true) { (result: Result<Plan, Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let plan):
                    self.planData = plan
                    print("План получен: \(plan.name)")
                case .failure(let error):
                    print("Ошибка получения плана: \(error.localizedDescription)")
                }
            }
        }
    }
    
    /// POST новый план
    func postPlan(plan: Plan, completion: @escaping (Result<Plan, Error>) -> Void) {
        let urlString = "http://127.0.0.1:8000/plans/"
        guard let bodyData = try? JSONEncoder().encode(plan) else {
            completion(.failure(APIError.noData))
            return
        }
        APIService.shared.request(urlString: urlString, method: "POST", body: bodyData, requiresAuth: true) { (result: Result<Plan, Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let plan):
                    self.planData = plan
                    print("План создан: \(plan.name)")
                    completion(.success(plan))
                case .failure(let error):
                    print("Ошибка создания плана: \(error.localizedDescription)")
                    completion(.failure(error))
                }
            }
        }
    }
}
