//
//  ProfileView.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 08.02.2025.
//

import SwiftUI
import Combine


struct ProfileView: View {
    @EnvironmentObject var dataSource: DataSource
    @State var plugUser : PlugUser
    
    var editSections : [ProfileSection]{
        return [
            ProfileSection(text: "Изменить профиль", image: "pencil", destination: AnyView(EditProfileView(user: plugUser)))
        ]
    }
    
    let settingSections : [ProfileSection] = [
        ProfileSection(text: "Безопастность", image: "lock.fill", destination: AnyView(SecuritySettingsView())),
        ProfileSection(text: "Уведомления", image: "bell.fill", destination: AnyView(NotificationsSettingsView())),
        ProfileSection(text: "Оформление", image: "wand.and.stars", destination: AnyView(AppearenceSettingsView())),
        ProfileSection(text: "Обратная связь", image: "envelope.fill", destination: AnyView(FeedbackView()))
    ]
    
    var accountSections: [ProfileSection] {
        return [
            ProfileSection(text: "Добавить аккаунт", image: "plus.circle.fill", destination: AnyView(Text("В разработке!"))),
            ProfileSection(
                text: plugUser.isTrener ? "Стать тренером" : "Стать клиентом",
                image: "arrow.triangle.2.circlepath",
                destination: AnyView(Text("В разработке!"))
            ),
            ProfileSection(text: "Выйти", image: "door.right.hand.open", destination: AnyView(Text("В разработке!")))
        ]
    }
    var body: some View {
        NavigationView{
            GeometryReader { geometry in
                ScrollView(.vertical) {
                    VStack(spacing: 0){
                        
                        // Notifications Bell
                        ProfileNotificationsBell(user: plugUser, geometry: geometry)
                        
                        // Image
                        ProfileImage(geometry: geometry, user: plugUser)
                        
                        // Name and rating
                        ProfileNameAndRating(user: plugUser, geometry: geometry)
                        
                        // EditSelections
                        ProfileSectionGroupView(geometry: geometry, sectionList: editSections)
                        
                        // TrackHub++
                        GradientButtonView(geometry: geometry)
                        
                        // SettingSelections
                        ProfileSectionGroupView(geometry: geometry, sectionList: settingSections)
                        
                        // AccountSelection
                        ProfileSectionGroupView(geometry: geometry, sectionList: accountSections)
                    }
                }
            }
            .background(Color(dataSource.selectedTheme.backgroundColor))
            .edgesIgnoringSafeArea(.all)
            .navigationTitle("Профиль")
            .navigationBarHidden(true)
        }
        .accentColor(Color(dataSource.selectedTheme.primaryColor))
        .edgesIgnoringSafeArea(.all)
    }
}



#Preview {
    ProfileView(plugUser: PlugUser(email: "", password: "", isTrener: true, avatar: "plugImage", name: "Роман", surname: "Николаев", notifications: ["Поздравляю! Вы выиграли билет на качественную порку!"], rating: 4.89)).environmentObject(DataSource())
}
