//
//  AboutTeamView.swift
//  Tracker Hub
//
//  Created by IvanM3 on 10.03.2025.
//

import SwiftUI

struct TeamView: View {
    @EnvironmentObject var dataSource: DataSource

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(spacing: 20) {
                        // Заголовок
                        Text("Наша команда")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
                            .padding(.top, 20)

                        // Описание команды
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Мы — команда TrackHubLab, которая разрабатывает приложение TrackHub. Наша команда состоит из трех человек: Смирнов Никита, Николаев Роман, Коновалов Иван. Присоединяйтесь к нам!")
                                .font(.body)
                                .foregroundColor(Color(dataSource.selectedTheme.secondaryBackgroundColor))
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 20)

                        }

                        // Ссылка на GitHub
                        Button(action: {
                            if let url = URL(string: "https://github.com/Nikita-Smirnov-idk/Tracker-Hub") {
                                UIApplication.shared.open(url)
                            }
                        }) {
                            HStack {
                                Image(systemName: "link")
                                    .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
                                Text("Наш GitHub")
                                    .font(.headline)
                                    .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
                            }
                            .padding()
                            .background(Color(dataSource.selectedTheme.backgroundColor))
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(dataSource.selectedTheme.primaryColor), lineWidth: 1)
                            )
                        }
                        .padding(.vertical, 10)

                        // Информация о лицензии
                        VStack(spacing: 5) {
                            Text("Created by TrackHubLab 2025")
                                .font(.caption)
                                .foregroundColor(Color(dataSource.selectedTheme.secondaryFontColor))

                            Text("Licensed by MIT")
                                .font(.caption)
                                .foregroundColor(Color(dataSource.selectedTheme.secondaryFontColor))
                        }
                        .padding(.bottom, 20)
                    }
                    .frame(maxWidth: .infinity, minHeight: geometry.size.height)
                }
                .background(Color(dataSource.selectedTheme.backgroundColor))
                .edgesIgnoringSafeArea(.all)
                .navigationTitle("Команда")
                .navigationBarHidden(true)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .accentColor(Color(dataSource.selectedTheme.primaryColor))
        .edgesIgnoringSafeArea(.all)
    }
}
