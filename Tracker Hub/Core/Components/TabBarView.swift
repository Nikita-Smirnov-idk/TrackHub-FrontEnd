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


/// View with Navigation Bar on the bottom of page (search / home / profile / settings / ...)
struct TabBarView: View {
    @EnvironmentObject var dataSource: DataSource
    @Binding var selectedPage: Int
    @State private var tabBarImages = [
        "house.fill",
        "person.2.fill",
        "dumbbell.fill",
        "person.fill"
    ]
    
    @State var geometry: GeometryProxy
    
    var body: some View {
        VStack(spacing: 0){
            Divider()
                .frame(width: .infinity, height: 2)
                .overlay(Color(dataSource.selectedTheme.primaryColor))
            GeometryReader{ proxy in
                HStack( spacing: 30){
                    ForEach(0..<tabBarImages.count, id: \.self){ i in
                        Image(systemName: tabBarImages[i])
                            .foregroundColor(selectedPage == i ? Color(dataSource.selectedTheme.primaryColor) : Color(dataSource.selectedTheme.secondaryBackgroundColor))
                            .onTapGesture {
                                withAnimation(.easeIn(duration: 0.1)) {
                                    selectedPage = i
                                }
                            }
                            .font(.system(size: proxy.size.height*0.7))
                            .padding()
                    }
                }
                .frame(maxWidth: geometry.size.width)
                .background(Color(dataSource.selectedTheme.backgroundColor))
            }
        }
    }
}

#Preview {
    @Previewable @State var selectedPage = 1
    GeometryReader{geometry in
        VStack{
            Spacer()
            TabBarView(selectedPage: $selectedPage, geometry:geometry).environmentObject(DataSource())
                .frame(height: geometry.size.height*0.05)
        }
    }
}
