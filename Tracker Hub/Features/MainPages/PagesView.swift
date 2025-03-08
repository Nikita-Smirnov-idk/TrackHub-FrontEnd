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

    
    @State var pages: [AnyView] = [
        AnyView(WorkoutTypesView()),
        AnyView(SearchPageView().environmentObject(DataSource())),
        AnyView(WorkoutPageView()),
        AnyView(ProfileView())
    ]
    
//    @State var pages: [AnyView] = [
//        AnyView(WorkoutTypesView()),
//        AnyView(WorkoutTypesView()),
//        AnyView(WorkoutTypesView()),
//        AnyView(ProfileView())
//    ]
    
    init() {
        UITabBar.appearance().isHidden = true
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            for window in windowScene.windows {
                window.backgroundColor = UIColor.darkGray
            }
        }
    }
    
    
    var body: some View {
        GeometryReader{geometry in
            VStack(spacing: 0) {
//                 SearchBarView(geometry: geometry).environmentObject(dataSource)
                pages[selectedPage]
                    .tag(selectedPage)
                    .tabViewStyle(DefaultTabViewStyle())
                TabBarView(selectedPage: $selectedPage, geometry: geometry)
                    .environmentObject(dataSource)
                    .frame(height: geometry.size.height * 0.05)
            }
            .background(Color(dataSource.selectedTheme.secondaryFontColor))
        }
        .dynamicTypeSize(DynamicTypeSize.large...DynamicTypeSize.accessibility1)
    }
}

#Preview {
    PagesView().environmentObject(DataSource())
}
