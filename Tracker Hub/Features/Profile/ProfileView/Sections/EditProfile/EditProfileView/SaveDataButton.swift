////
////  SaveDataButton.swift
////  Tracker Hub
////
////  Created by Рома Николаев on 11.02.2025.
////
//
//import SwiftUI
//
//struct SaveDataButton: View {
//    @StateObject var dataSource = DataSource()
//    @State var hasChanges: Bool
//    @Binding var user: User
//    @Binding var tempUser: User
//    @ObservedObject var viewModel: EditProfileViewModel
//    var geometry: GeometryProxy
//    
//    init(hasChanges: Bool, user: Binding<User>, tempUser: Binding<User>, geometry: GeometryProxy) {
//        self._user = user
//        self._tempUser = tempUser
//        self.hasChanges = hasChanges
////        self.viewModel = EditProfileViewModel(user: user) // передаем через @Binding
//        self.geometry = geometry
//    }
//    
//    var body: some View {
//        Button(action: { saveData() }) {
//            Text("Сохранить")
//                .frame(width: geometry.size.width * 0.85, height: geometry.size.height * 0.08)
//                .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 16))
//                .foregroundStyle(Color(dataSource.selectedTheme.backgroundColor))
//                .background(hasChanges ? Color(dataSource.selectedTheme.primaryColor) : Color(dataSource.selectedTheme.secondaryBackgroundColor))
//                .cornerRadius(20)
//        }
//    }
//    
//    private func saveData() {
//        print("Данные сохранены")
//        
//        if hasChanges {
//            user = tempUser
//            viewModel.editProfile()
//        }
//    }
//}
//
