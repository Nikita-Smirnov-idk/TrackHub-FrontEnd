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
        AnyView(WorkoutTypesView())
    ]
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        GeometryReader{geometry in
            VStack {
                SearchBarView(geometry: geometry).environmentObject(dataSource)
                pages[selectedPage]
                    .tag(selectedPage)
                    .tabViewStyle(DefaultTabViewStyle())
                    .ignoresSafeArea()
                Spacer()
                TabBarView(selectedPage: $selectedPage, geometry: geometry).environmentObject(dataSource)
                    .frame(height: geometry.size.height * 0.05)
            }.background(Color(dataSource.selectedTheme.backgroundColor))
        }
        .dynamicTypeSize(DynamicTypeSize.large...DynamicTypeSize.accessibility1)
    }
}

#Preview {
    PagesView().environmentObject(DataSource())
}
