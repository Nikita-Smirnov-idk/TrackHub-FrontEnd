//
//  TabBarView.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 06.12.2024.
//

import SwiftUI

enum tabBarImages{
    case magnifyingglass
    case house
    case person
    case gear
}

struct TabBarView: View {
    @Binding var selectedPage: Int
    @State private var tabBarImages = [
        "magnifyingglass",
        "house.fill",
        "person.fill",
        "gearshape.fill"
    ]
    
    @State var yelllowColor = Color(hex: "F5FE6C")
    @State var lightGray = Color(hex: "757575")
    @State var darkGray = Color(hex: "474747")
    
    var body: some View {
        GeometryReader { geometry in
            let geometryWidth = geometry.size.width
            let geometryHeight = geometry.size.height
            let geometryFontSize = geometryWidth * 0.06
            
            VStack {
                Spacer()
                HStack{
                    ForEach(0..<tabBarImages.count) { i in
                        Spacer()
                        Image(systemName: tabBarImages[i])
                            .padding()
                            .font(.system(size: geometryFontSize))
                            .foregroundColor(selectedPage == i ? yelllowColor : lightGray)
                            .onTapGesture {
                                withAnimation(.easeIn(duration: 0.1)) {
                                    selectedPage = i
                                }
                            }
                        Spacer()
                    }
                }
                .frame(height: geometryHeight * 0.1)
                .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
    }
}

//#Preview {
//    TabBarView(selectedPage: 0)
//}
