////
////  DeleteAccountViewModel.swift
////  Tracker Hub
////
////  Created by Рома Николаев on 22.02.2025.
////
//
//import Foundation
//import SwiftKeychainWrapper
//
//class DeleteAccountViewModel {
//    
//    func deleteAccount() {
//        let urlString = "http://127.0.0.1:8000/auth/delete-account/"
//        APIService.shared.request(urlString: urlString, method: "DELETE", requiresAuth: true){ (result: Result<String, Error>)  in
//            DispatchQueue.main.async {
//                switch result {
//                case .success():
//                    print("Аккаунт удален")
//                case .failure(let error):
//                    print("Ошибка удаления профиля: \(error.localizedDescription)")
//                }
//            }
//        }
//    }
//}
