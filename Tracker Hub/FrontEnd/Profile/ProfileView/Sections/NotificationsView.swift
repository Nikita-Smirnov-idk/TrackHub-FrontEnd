//
//  NotificationsView.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 09.02.2025.
//

import SwiftUI

struct NotificationsView: View {
    @EnvironmentObject var dataSource: DataSource
    
    var body: some View {
        GeometryReader { geometry in
            Text("NotificationsView")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(Color(dataSource.selectedTheme.backgroundColor))
        .edgesIgnoringSafeArea(.all)
    }
}
