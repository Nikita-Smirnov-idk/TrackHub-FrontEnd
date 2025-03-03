import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var dataSource: DataSource
    @StateObject var viewModel = ProfileViewModel()

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                if let user = viewModel.profileData {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVStack(spacing: 0) {
                            
                            // Notifications Bell
                            ProfileNotificationsBell(user: user, geometry: geometry)
                            
                            // Image
                            ProfileImage(geometry: geometry, user: user)
                            
                            // Name and rating
                            ProfileNameAndRating(user: user, geometry: geometry)
                            
                            // Edit Section
                            ProfileSectionGroupView(
                                geometry: geometry,
                                sectionList: [
                                    ProfileSection(
                                        text: "Изменить профиль",
                                        image: "pencil",
                                        destination: AnyView(EditProfileView(user: $viewModel.profileData))
                                    )
                                ]
                            )
                            
                            // TrackHub++
                            GradientButtonView(geometry: geometry)
                            
                            // Setting Sections
                            ProfileSectionGroupView(
                                geometry: geometry,
                                sectionList: [
                                    ProfileSection(text: "Безопасность", image: "lock.fill", destination: AnyView(SecuritySettingsView())),
                                    ProfileSection(text: "Уведомления", image: "bell.fill", destination: AnyView(NotificationsSettingsView())),
                                    ProfileSection(text: "Оформление", image: "wand.and.stars", destination: AnyView(AppearenceSettingsView())),
                                    ProfileSection(text: "Обратная связь", image: "envelope.fill", destination: AnyView(FeedbackView()))
                                ]
                            )
                            
                            // Account Sections
                            ProfileSectionGroupView(
                                geometry: geometry,
                                sectionList: [
                                    ProfileSection(text: "Добавить аккаунт", image: "plus.circle.fill", destination: AnyView(Text("В разработке!"))),
                                    ProfileSection(
                                        text: user.isTrener ? "Стать тренером" : "Стать клиентом",
                                        image: "arrow.triangle.2.circlepath",
                                        destination: AnyView(Text("В разработке!"))
                                    ),
                                    ProfileSection(text: "Выйти", image: "door.right.hand.open", destination: AnyView(Text("В разработке!")))
                                ]
                            )
                        }
                        .frame(maxWidth: .infinity, minHeight: geometry.size.height)
                    }
                    .background(Color(dataSource.selectedTheme.backgroundColor))
                    .edgesIgnoringSafeArea(.all)
                    .navigationTitle("Профиль")
                    .navigationBarHidden(true)
                } else {
                    // Показываем индикатор загрузки, пока данные не получены
                    VStack {
                        Spacer()
                        ProgressView("Загрузка профиля...")
                            .progressViewStyle(CircularProgressViewStyle())
                        Spacer()
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .background(Color(dataSource.selectedTheme.backgroundColor))
                    .edgesIgnoringSafeArea(.all)
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .accentColor(Color(dataSource.selectedTheme.primaryColor))
        .edgesIgnoringSafeArea(.all)
    }
}
