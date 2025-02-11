//
//  ProfileNotificationsBell.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 10.02.2025.
//

import SwiftUI

struct ProfileNotificationsBell: View {
    @StateObject var dataSource = DataSource()
    var user: PlugUser
    var geometry: GeometryProxy
    
    var body: some View {
        Spacer()
        HStack{
            NavigationLink(
                destination: NotificationsView(),
                label: {
                    Image(systemName: user.notifications.count > 0 ? "bell.badge.fill" :"bell.fill")
                        .foregroundStyle(Color(dataSource.selectedTheme.primaryColor))
                        .font(.system(size: geometry.size.height * 0.025))
                        .padding()
                }
            )
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        .padding()
    }
}
