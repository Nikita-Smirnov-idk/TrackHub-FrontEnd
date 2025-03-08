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
    @State private var selectedSortOption : String? = nil
    @State private var isSortShow: Bool = false
    @Binding var isFilterShow: Bool
    @State private var searchText = ""
    @State var isPushedFemale: Bool = false
    @State var isPushedMale: Bool = false
    @State var geometry: GeometryProxy
    @State var fastFilters : [String: Bool] = [
        "Платные" : false,
        "План" : false,
        "Силовые" : false,
        "Бесплатные" : false,
        "Кардио" : false
    ]

    var body: some View {
        let geometryWidth = geometry.size.width
        let geometryHeight = geometry.size.height
        
        
        ZStack(alignment: .top) {
            VStack {
                HStack(spacing: 0){
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
                            TextField("Поиск", text: $searchText)
                                .frame(height: geometryHeight * 0.05)
                                .foregroundColor(Color(dataSource.selectedTheme.backgroundColor))
                                .padding(.horizontal)
                                .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: RelativeFontSize(size: 13, func_coef: 16, plus_value: 2.7, divider_value: 4.1)))
                                .multilineTextAlignment(.leading)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .background(Color(dataSource.selectedTheme.secondaryBackgroundColor))
                    .cornerRadius(45)
                    
                    Image(systemName: "arrow.up.arrow.down")
                        .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
                        .scaledToFit()
                        .frame(
                            width: geometryWidth * 0.1,
                            height: geometryWidth * 0.1)
                        .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: RelativeFontSize(13)))
                        .onTapGesture {
                            isSortShow.toggle()
                        }
                        .confirmationDialog("Sort By", isPresented: $isSortShow) {
                            SortSheetView(geometry: geometry, selectedOption: $selectedSortOption)
                            Button("Закрыть", role: .cancel) {}
                        }
                    
                    
                    Image(systemName: "slider.horizontal.3")
                        .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
                        .scaledToFit()
                        .frame(
                            width: geometryWidth * 0.1,
                            height: geometryWidth * 0.1)
                        .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: RelativeFontSize(13)))
                        .onTapGesture {
                            isFilterShow.toggle()
                        }
//                        .sheet(isPresented: $isFilterShow) {
//                            FiltersSheetView()
//                                .presentationDetents([.large])
//                                .presentationDragIndicator(.visible)
//                        }
                    
                }
                .frame(width: .infinity, height: geometryHeight * 0.05)
                .padding(2.0)
                
                
                ScrollView(.horizontal, showsIndicators: false) { // Горизонтальный ScrollView
                    HStack(spacing: 10) { // Горизонтальный контейнер для кнопок
                        ForEach(Array(fastFilters.keys.sorted()), id: \.self) { key in
                            Button {
                                // Безопасное изменение состояния
                                withAnimation(.easeInOut(duration: 0.3)) {
                                    if let value = fastFilters[key] {
                                        fastFilters[key] = !value
                                    }
                                }
                            } label: {
                                Text(key)
                                    .padding(.horizontal, 12) // Горизонтальный отступ для текста
                                    .padding(.vertical, 8) // Вертикальный отступ для текста
                                    .frame(height: AdaptiveValue(idealValue: geometryHeight * 0.025, minValue: 35, maxValue: 45))
                                    .background(
                                        fastFilters[key] == false ? // Проверяем, что значение не nil
                                        Color(dataSource.selectedTheme.secondaryBackgroundColor) :
                                            Color(dataSource.selectedTheme.primaryColor)
                                    )
                                    .foregroundColor(
                                        fastFilters[key] == false ? // Проверяем, что значение не nil
                                        Color(dataSource.selectedTheme.primaryColor) :
                                            Color(dataSource.selectedTheme.secondaryBackgroundColor)
                                    )
                                    .cornerRadius(45)
                                    .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 13))
                            }
                        }
                    }
                    .padding() // Отступы по краям для красивого отображения
                }
                
            }.background(Color(dataSource.selectedTheme.backgroundColor))
        }
        .accentColor(Color(dataSource.selectedTheme.primaryColor))
    }
}


#Preview {
    GeometryReader{geometry in
        VStack{
            SearchBarView(isFilterShow: .constant(true), geometry: geometry).environmentObject(DataSource())
        }
    }
}
