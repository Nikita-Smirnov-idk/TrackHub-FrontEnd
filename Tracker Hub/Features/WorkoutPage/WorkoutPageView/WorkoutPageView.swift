//
//  WorkoutPageView.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 08.03.2025.
//

import SwiftUI

struct WorkoutPageView: View {
    @StateObject private var dataSource = DataSource()
    
    let categories: [String:String] = [
        "Мои": "Планы, тренировки, упражнения, созданные вами",
        "Мои опубликованные": "Планы, тренировки, упражнения, созданные вами и высталенные в общий доступ",
        "Подписки": "Планы, тренировки, упражнения, созданные другими"
    ]
    
    let categoriesNames: [String] = ["Мои", "Мои опубликованные", "Подписки"]
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack(spacing: 15) {
                    ForEach(categoriesNames, id: \.self) { category in
                        if let categoryDescription = categories[category]{
                            NavigationLink(destination: chooseDestination(category), label: {
                                categoryView(category, categoryDescription, geometry)
                                    .padding()
                            })
                            .tint(Color(dataSource.selectedTheme.primaryColor))
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
            .background(Color(dataSource.selectedTheme.backgroundColor))
            .navigationTitle("Категории")
        }
        .accentColor(Color(dataSource.selectedTheme.primaryColor))
    }
    
    private func categoryView(_ category: String, _ categoryDescription: String, _ geometry: GeometryProxy) -> some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(dataSource.selectedTheme.buttonsBackgroundColor))

            VStack(spacing: 0){
                Text(category)
                    .font(Font.custom(Fonts.ReadexPro_Medium.rawValue, size: 23))
                    .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing])
                
                Text(categoryDescription)
                    .font(Font.custom(Fonts.ReadexPro_Medium.rawValue, size: 14))
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color(dataSource.selectedTheme.secondaryFontColor))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
            }
        }
        .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.25)
    }
    
    private func chooseDestination(_ category: String) -> some View {
        switch category {
        case "Мои":
            return AnyView(WorkoutsGroupView(categoryName: "Мои"))
        case "Мои опубликованные":
            return AnyView(WorkoutsGroupView(categoryName: "Мои опубликованные"))
        case "Подписки":
            return AnyView(WorkoutsGroupView(categoryName: "Подписки"))
        default:
            fatalError("Unsupported category: \(category)")
        }
    }

}

#Preview {
    WorkoutPageView()
}
