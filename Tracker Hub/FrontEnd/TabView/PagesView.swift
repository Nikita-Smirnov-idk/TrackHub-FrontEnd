//
//  TabView.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 05.12.2024.
//

import SwiftUI

struct PagesView: View {
    @State var selectedPage = 0
    @State var tabBarImages = [
        "magnifyingglass",
        "house.fill",
        "person.fill",
        "gearshape.fill"
    ]
    
    @State var pages: [AnyView] = [
        AnyView(SearchView()),
        AnyView(FirstQuestionView()),
        AnyView(FirstQuestionView()),
        AnyView(SearchView())
    ]
    @State var yelllowColor = Color(hex: "F5FE6C")
    @State var lightGray = Color(hex: "757575")
    @State var darkGray = Color(hex: "474747")
    
    var body: some View {
        TabView(selection: $selectedPage) {
            ForEach(0..<pages.count, id: \.self) { i in
                pages[i]
                    .tag(i)
                    .tabItem{
                        VStack {
                            Image(systemName: tabBarImages[i])
                                .foregroundColor(selectedPage == i ? yelllowColor : lightGray)
                        }

                    }
            }
        }
        .tabViewStyle(DefaultTabViewStyle())
        .ignoresSafeArea()
    }
}

#Preview {
    PagesView()
}
