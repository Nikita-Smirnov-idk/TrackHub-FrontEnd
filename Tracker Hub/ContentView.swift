//
//  ContentView.swift
//  Tracker Hub
//
//  Created by Никита Смирнов on 28.11.2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dataSource: DataSource
    var body: some View {
        PagesView().environmentObject(DataSource())
    }
}

#Preview {
    ContentView()
}
