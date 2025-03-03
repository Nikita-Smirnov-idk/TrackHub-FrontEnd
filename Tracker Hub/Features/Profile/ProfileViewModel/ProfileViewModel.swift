//
//  ProfileViewModel.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 20.02.2025.
//

import Foundation
import SwiftKeychainWrapper

class ProfileViewModel: ObservableObject {
    @Published var profileData: User?
    @Published var userId: String = KeychainWrapper.standard.string(forKey: "userID") ?? ""
    
    init() {
        self.profileData = User()
        getProfileData()
    }
    
    func getProfileData() {
        let urlString = "http://127.0.0.1:8000/auth/profile/\(userId)/"
        APIService.shared.request(urlString: urlString, method: "GET", requiresAuth: true) { (result: Result<User, Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let user):
                    self.profileData = user
                case .failure(let error):
                    print("Ошибка получения профиля: \(error.localizedDescription)")
                }
            }
        }
    }
}

