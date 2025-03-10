//
//  EditProfileView.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 09.02.2025.
//

import SwiftUI

struct EditProfileView: View {
    @Environment(\.dismiss) private var dismiss

    @StateObject var dataSource = DataSource()
    @Binding var user: User?
    @State private var tempUser: User
    @State private var hasChanges: Bool = false
    @ObservedObject var viewModel: EditProfileViewModel
    
    init(user: Binding<User?>) {
        self._user = user
        
        // Проверка на nil для user, чтобы избежать ошибок с unwrap
        if let unwrappedUser = user.wrappedValue {
            self._tempUser = State(initialValue: unwrappedUser)
            self._viewModel = ObservedObject(wrappedValue: EditProfileViewModel(user: unwrappedUser))
        } else {
            // Обработка случая, когда user == nil
            self._tempUser = State(initialValue: User()) // Или ваш дефолтный профиль
            self._viewModel = ObservedObject(wrappedValue: EditProfileViewModel(user: User())) // Пустой профиль или дефолтные значения
        }
    }

    
    var nameFields: [EditProfileSection] {
        return [
            EditProfileSection(title: "Имя", titleField: $tempUser.name),
            EditProfileSection(title: "Фамилия", titleField: $tempUser.surname),

        ]
    }
    
    var loginFields: [EditProfileSection]{
        return [
            EditProfileSection(title: "Почта", titleField: $tempUser.email),
        ]
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        EdtiProfileSectionGroup(geometry: geometry, hasChanges: $hasChanges, sectionList: nameFields)
                        
                        EdtiProfileSectionGroup(geometry: geometry, hasChanges: $hasChanges, sectionList: loginFields)
                        
                        //SaveDataButton(hasChanges: hasChanges, user: $user, tempUser: $tempUser, geometry: geometry)
                        
                        Button(action: {saveData()}){
                            Text("Сохранить")
                                .frame(width: geometry.size.width * 0.85, height: geometry.size.height * 0.08)
                                .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 16))
                                .foregroundStyle(Color(dataSource.selectedTheme.backgroundColor))
                                .background(hasChanges ? Color(dataSource.selectedTheme.primaryColor):Color(dataSource.selectedTheme.secondaryBackgroundColor))
                                .cornerRadius(20)
                        }
                        .disabled(!hasChanges)
                    }
                    .frame(maxWidth: .infinity, minHeight: geometry.size.height)
                }
                .simultaneousGesture(DragGesture())
            }
            .background(Color(dataSource.selectedTheme.backgroundColor))
            .edgesIgnoringSafeArea(.all)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private func saveData() {
        print("Данные сохранены")
        
        if hasChanges {
            viewModel.user = tempUser
            viewModel.editProfile()
            user = viewModel.user
        }
        
        dismiss()
    }
}

//#Preview {
//    EditProfileView(user: PlugUser(email: "arem379@mail.ru", password: "", phoneNumber: "+79143783306", isMale: true, isTrener: true, avatar: "plugImage", name: "Роман", surname: "Николаев", notifications: ["Поздравляю! Вы выиграли билет на качественную порку!"], rating: 4.89))
//}
