//
//  EditProfileViewModel.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 20.02.2025.
//

import SwiftUI
import Foundation
import SwiftKeychainWrapper

class EditProfileViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
    
    func editProfile() {
        // Кодируем currentProfileData в JSON
        do {
            let bodyData = try JSONEncoder().encode(user) // используем binding напрямую
            
            // Отправляем запрос с закодированными данными
            APIService.shared.request(urlString: "http://127.0.0.1:8000/auth/change_user_data/", method: "PUT", body: bodyData, requiresAuth: true) { (result: Result<User, Error>) in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let user):
                        self.user = user  // обновляем данные после успешного ответа
                        print("все оккк")
                    case .failure(let error):
                        print("Ошибка получения профиля: \(error.localizedDescription)")
                    }
                }
            }
        } catch {
            print("Ошибка кодирования данных профиля: \(error.localizedDescription)")
        }
    }
}
