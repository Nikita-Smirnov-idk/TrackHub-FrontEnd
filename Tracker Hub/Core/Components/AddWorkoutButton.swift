//
//  AddWorkoutButton.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 08.03.2025.
//

import SwiftUI

struct AddWorkoutButton: View {
    var geometry: GeometryProxy
    var onAdd: (() -> Void)?
    @StateObject var dataSource = DataSource()
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(dataSource.selectedTheme.buttonsBackgroundColor))
                
            VStack {
                
                Image(systemName: "plus.circle")
                    .resizable()
                    .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
                    .frame(width: geometry.size.width * 0.2, height: geometry.size.width * 0.2)
                    .onTapGesture {
                        if let onAdd = onAdd {
                            onAdd()
                        }
                    }
            }
        }
        .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.2)
    }
}
