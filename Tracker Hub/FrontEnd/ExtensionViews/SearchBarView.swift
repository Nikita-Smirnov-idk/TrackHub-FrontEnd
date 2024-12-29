//
//  MenuView.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 05.12.2024.
//

import SwiftUI



/// View block with search bar and filters
struct SearchBarView: View {
    @EnvironmentObject var dataSource: DataSource
    @State private var searchText = ""
    @State var isPushedFemale: Bool = false
    @State var isPushedMale: Bool = false
    @State var geometry: GeometryProxy

    var body: some View {
        let geometryWidth = geometry.size.width
        let geometryHeight = geometry.size.height
        
        VStack {
            HStack{
                Spacer()
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
                        .scaledToFit()
                        .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: RelativeFontSize(13)))
                        .frame(width: AdaptiveValue(idealValue:geometryWidth * 0.05, minValue: 40, maxValue: 80), height: AdaptiveValue(idealValue:geometryHeight * 0.05, minValue: 40, maxValue: 80))
                        .padding(.leading, 10)
                    Divider()
                        .frame(width: 2, height: geometryHeight * 0.05)
                        .overlay(Color(dataSource.selectedTheme.backgroundColor))
                    HStack{
                        TextField("Поиск тренеров", text: $searchText)
                            .frame(height: geometryHeight * 0.05)
                            .foregroundColor(Color(dataSource.selectedTheme.backgroundColor))
                            .padding(.horizontal)
                            .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: RelativeFontSize(size: 13, func_coef: 10, plus_value: 2.7, divider_value: 4.1)))
                            .multilineTextAlignment(.leading)
                    }
                    Spacer()
                }
                .frame(width: AdaptiveValue(idealValue: geometryWidth * 0.4, minValue: 200, maxValue: 400), height: AdaptiveValue(idealValue: geometryHeight * 0.025, minValue: 35, maxValue: 45))
                
                .background(Color(dataSource.selectedTheme.secondaryBackgroundColor))
                .cornerRadius(45)
                    
                Image(systemName: "slider.horizontal.3")
                    .padding(.horizontal)
                    .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: RelativeFontSize(13)))
                    .onTapGesture {
                        //code for filters
                    }

                    
                Spacer()

            }
            .frame(width: .infinity, height: geometryHeight * 0.05)
            .padding(2.0)
            
            HStack {
                Spacer()
                Text("Пол:")
                    .padding()
                    .frame(height: AdaptiveValue(idealValue: geometryHeight * 0.025, minValue: 35, maxValue: 45))
                    .background(Color(dataSource.selectedTheme.secondaryBackgroundColor))
                    .foregroundColor(Color(dataSource.selectedTheme.backgroundColor))
                    .cornerRadius(45)
                    .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 13))
                    .padding(.leading)
                                        
                Spacer()
                
                Button(){
                    if isPushedMale == true{
                        isPushedMale.toggle()
                        isPushedFemale.toggle()
                    } else {
                        isPushedFemale.toggle()
                    }
                } label: {
                    Text("Женский")
                        .padding()
                        .frame(height: AdaptiveValue(idealValue: geometryHeight * 0.025, minValue: 35, maxValue: 45))
                        .background(!isPushedFemale ? Color(dataSource.selectedTheme.secondaryBackgroundColor) : Color(dataSource.selectedTheme.primaryColor))
                        .foregroundColor(!isPushedFemale ? Color(dataSource.selectedTheme.primaryColor) : Color(dataSource.selectedTheme.secondaryBackgroundColor))
                        .cornerRadius(45)
                        .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 13))
                }
                     
                Spacer()
                Button(){
                    if isPushedFemale==true{
                        isPushedMale.toggle()
                         isPushedFemale.toggle()
                    } else {
                        isPushedMale.toggle()
                    }
                } label: {
                    Text("Мужской")
                        .padding()
                        .frame(height: AdaptiveValue(idealValue: geometryHeight * 0.025, minValue: 35, maxValue: 45))
                        .background(!isPushedMale ? Color(dataSource.selectedTheme.secondaryBackgroundColor) : Color(dataSource.selectedTheme.primaryColor))
                        .foregroundColor(!isPushedMale ? Color(dataSource.selectedTheme.primaryColor) : Color(dataSource.selectedTheme.secondaryBackgroundColor))
                        .cornerRadius(45)
                        .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 13))
                        .padding(.trailing)
                }
                Spacer()
            }
            .padding([.bottom, .top])
        }.background(Color(dataSource.selectedTheme.backgroundColor))
    }
}

#Preview {
    GeometryReader{geometry in
        VStack{
            SearchBarView(geometry: geometry).environmentObject(DataSource())
        }
    }
}
