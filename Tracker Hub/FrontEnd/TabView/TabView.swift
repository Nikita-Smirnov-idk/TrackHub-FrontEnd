//
//  TabView.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 05.12.2024.
//

import SwiftUI

struct TabBarView: View {
    @State var selectedPage = 0
    @State var tabBarImages = [
        "magnifyingglass",
        "house.fill",
        "person.fill",
        "gearshape.fill"
    ]
    
    @State var pages = [
        SearchView(),
        SearchView(),
        SearchView(),
        SearchView()
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
                        Image(systemName: tabBarImages[i])
                            .background(selectedPage == i ? yelllowColor : lightGray)
                            .onTapGesture {
                                selectedPage = i
                            }
                    }
            }
        }
                .tabViewStyle(DefaultTabViewStyle()).ignoresSafeArea()
    }
}

#Preview {
    TabBarView()
}
