//
//  TabView.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 05.12.2024.
//

import SwiftUI

struct PagesView: View {
    @EnvironmentObject var dataSource: DataSource
    @State var selectedPage = 0
//    @State var tabBarImages = [
//        "magnifyingglass",
//        "house.fill",
//        "person.fill",
//        "gearshape.fill"
//    ]
    
    @State var pages: [AnyView] = [
        AnyView(WorkoutTypesView()),
        AnyView(FirstQuestionView()),
        AnyView(FirstQuestionView()),
        AnyView(WorkoutTypesView()),
        AnyView(ProfileView(plugUser: PlugUser(email: "", password: "", phoneNumber: "+79143783306", isMale: true, isTrener: true, avatar: "plugImage", name: "Роман", surname: "Николаев", notifications: ["Поздравляю! Вы выиграли билет на качественную порку!"], rating: 4.89)))
    ]
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        GeometryReader{geometry in
            VStack(spacing: 0) {
//                SearchBarView(geometry: geometry).environmentObject(dataSource)
                pages[selectedPage]
                    .tag(selectedPage)
                    .tabViewStyle(DefaultTabViewStyle())
                TabBarView(selectedPage: $selectedPage, geometry: geometry).environmentObject(dataSource)
                    .frame(height: geometry.size.height * 0.05)
            }.background(Color(dataSource.selectedTheme.secondaryFontColor))
        }
        .dynamicTypeSize(DynamicTypeSize.large...DynamicTypeSize.accessibility1)
    }
}

#Preview {
    PagesView().environmentObject(DataSource())
}
