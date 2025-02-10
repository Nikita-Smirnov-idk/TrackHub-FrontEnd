//
//  EditProfileView.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 09.02.2025.
//

import SwiftUI

struct EditProfileView: View {
    @StateObject var dataSource = DataSource()
    var user: PlugUser
    let nameFields: [String] = [
        "Имя",
        "Фамилия"
    ]
    
    let loginFields: [String] = [
        "Почта",
    ]
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                EdtiProfileSectionGroup(geometry: geometry, sectionList: nameFields, user: user)
                
                EdtiProfileSectionGroup(geometry: geometry, sectionList: loginFields, user: user)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
        .background(Color(dataSource.selectedTheme.backgroundColor))
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    EditProfileView(user:  PlugUser(email: "", password: "", isTrener: true, avatar: "plugImage", name: "Роман", surname: "Николаев", notifications: ["Поздравляю! Вы выиграли билет на качественную порку!"], rating: 4.89))
}
