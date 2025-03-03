//
//  FiltersSheetView.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 03.03.2025.
//

import SwiftUI

struct FiltersSheetView: View {
    
    @StateObject var dataSource = DataSource()
    @State private var filters: [String : [String]] = [
        "Тип тренировки":["Силовые", "Кардио", "Йога", "Кроссфит", "Функциональные"],
        "Цель":["Похудение", "Набор массы", "Увеличение выносливости", "Реабилитация", "Общее укрепление здоровья"],
        "Пол":["Для мужчин", "Для женщин", "Универсальные"],
        "Тип питания":["С рекомендациями по питанию", "Без рекомендаций по питанию"],
        "Частота тренировок":["3 раза", "2 раза", "Еженедневные"]
    ]
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack{
                    ForEach(Array(filters.keys.sorted()), id: \.self) { key in
                        Text(key)
                            .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 16))
                            .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ForEach(filters[key] ?? [], id: \.self) { value in
                            HStack{
                                Text(value)
                                    .font(Font.custom(Fonts.ReadexPro_Medium.rawValue, size: 14))
                                    .foregroundColor(Color(dataSource.selectedTheme.secondaryFontColor))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Toggle(isOn: .constant(false)) {
                                    
                                }
                            }
                        }
                        
                        Divider()
                            .background(Color(dataSource.selectedTheme.primaryColor))
                    }
                }
                .padding()
            }
        }
        .background(Color(dataSource.selectedTheme.backgroundColor))
    }
}

#Preview {
    FiltersSheetView()
}
