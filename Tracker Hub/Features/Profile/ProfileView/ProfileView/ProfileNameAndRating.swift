//
//  ProfileNameAndRating.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 10.02.2025.
//

import SwiftUI

struct ProfileNameAndRating: View {
    @StateObject var dataSource = DataSource()
    var user: User
    var geometry: GeometryProxy
    
    var body: some View {
        VStack(spacing: 0) {
            Text("\(user.name) \(user.surname)")
                .frame(width: geometry.size.width * 0.75)
                .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 26))
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .padding([.bottom, .top])
                .foregroundStyle(Color(dataSource.selectedTheme.primaryColor))
            
            HStack(spacing: 0) {
                Image(systemName: "star.fill")
                    .foregroundStyle(Color(dataSource.selectedTheme.primaryColor))
                    .font(.system(size: geometry.size.height * 0.025))
                
                Text(String(format: "%.2f", user.rating))
                    .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 20))
                    .foregroundStyle(Color(dataSource.selectedTheme.primaryColor))
            }
        }
        .padding(.bottom)
    }
}
