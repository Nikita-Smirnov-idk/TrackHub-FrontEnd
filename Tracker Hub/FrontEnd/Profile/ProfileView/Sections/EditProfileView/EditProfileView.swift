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
    @Binding var user: PlugUser
    @State var tempUser: PlugUser
    @State var hasChanges: Bool = false
    
    init(user: Binding<PlugUser>) {
            self._user = user
            self._tempUser = State(initialValue: user.wrappedValue)
    }

    
    var nameFields: [EditProfileSection] {
        return [
            EditProfileSection(title: "Имя", titleField: $tempUser.name),
            EditProfileSection(title: "Фамилия", titleField: $tempUser.surname),
            EditProfileSection(
                title: "Пол",
                titleField: Binding.constant(tempUser.isMale ? "Мужской" : "Женский")
            )
        ]
    }
    
    var loginFields: [EditProfileSection]{
        return [
            EditProfileSection(title: "Почта", titleField: $tempUser.email),
            EditProfileSection(title: "Телефон", titleField: $tempUser.phoneNumber)
        ]
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
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
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            }
            .background(Color(dataSource.selectedTheme.backgroundColor))
            .edgesIgnoringSafeArea(.all)
        }
    }
    
    private func saveData() {
        print("Данные сохранены")
        
        if hasChanges {
            user = tempUser
        }
        
        dismiss()
    }
}

//#Preview {
//    EditProfileView(user: PlugUser(email: "arem379@mail.ru", password: "", phoneNumber: "+79143783306", isMale: true, isTrener: true, avatar: "plugImage", name: "Роман", surname: "Николаев", notifications: ["Поздравляю! Вы выиграли билет на качественную порку!"], rating: 4.89))
//}
