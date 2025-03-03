//
//  SecuritySettingsView.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 09.02.2025.
//

import SwiftUI

struct SecuritySettingsView: View {
    @EnvironmentObject var dataSource: DataSource
    
    var body: some View {
        GeometryReader { geometry in
            Text("SecuritySettingsView")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(Color(dataSource.selectedTheme.backgroundColor))
        .edgesIgnoringSafeArea(.all)
    }
}
