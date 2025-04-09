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
        "Тип тренировки": ["Силовые", "Кардио", "Йога", "Кроссфит", "Функциональные"],
        "Цель": ["Похудение", "Набор массы", "Увеличение выносливости", "Реабилитация", "Общее укрепление здоровья"],
        "Пол": ["Для мужчин", "Для женщин", "Универсальные"],
        "Тип питания": ["С рекомендациями по питанию", "Без рекомендаций по питанию"],
        "Частота тренировок": ["3 раза", "2 раза", "Еженедельные"]
    ]
    var geometry: GeometryProxy
    @State var selectedFilters: [String] = []
    
    var body: some View {
        ZStack {
            Color.clear // прозрачный фон для всей вьюхи
            ScrollView(.vertical, showsIndicators: false) {
                VStack(){
                    
                    VStack(spacing: 8) {
                        Text("Фильтры")
                            .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 28))
                            .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
                        
                        Text("Выберите нужные параметры для поиска")
                            .font(Font.custom(Fonts.ReadexPro_Medium.rawValue, size: 16))
                            .foregroundColor(Color(dataSource.selectedTheme.secondaryFontColor))
                    }
                    .padding(.vertical, 20)
                    .frame(maxWidth: .infinity)
                    .background(Color(dataSource.selectedTheme.backgroundColor))
                    
                    ForEach(Array(filters.keys.sorted()), id: \.self) { key in
                        Text(key)
                            .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 16))
                            .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ForEach(filters[key] ?? [], id: \.self) { value in
                            HStack {
                                Text(value)
                                    .font(Font.custom(Fonts.ReadexPro_Medium.rawValue, size: 14))
                                    .foregroundColor(Color(dataSource.selectedTheme.secondaryFontColor))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Toggle(isOn: Binding<Bool>(
                                    get: {
                                        selectedFilters.contains(value)
                                    },
                                    set: { newValue in
                                        if newValue {
                                            // Если пользователь включил тумблер, добавляем значение в массив
                                            selectedFilters.append(value)
                                        } else {
                                            // Если пользователь выключил тумблер, убираем из массива
                                            selectedFilters.removeAll { $0 == value }
                                        }
                                    }
                                )) {
                                    EmptyView() // Пустая подпись, т.к. текст у нас уже слева
                                }
                                .toggleStyle(CustomToggleStyle())
                            }
                        }
                        
                        Divider()
                            .background(Color(dataSource.selectedTheme.primaryColor))
                    }
                    
                    
                    Button(action: {
                        // Ваш экшн для кнопки "Показать"
                    }) {
                        Text("Показать")
                            .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 16))
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: true, vertical: true)
                            .padding()
                            .frame(width: geometry.size.width * 0.7,
                                   height: geometry.size.height * 0.1)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(selectedFilters.isEmpty ?
                                          Color(dataSource.selectedTheme.buttonsBackgroundColor) :
                                          Color(dataSource.selectedTheme.primaryColor))
                            )
                            .foregroundColor(Color(dataSource.selectedTheme.backgroundColor))
                    }
                    .disabled(selectedFilters.isEmpty)
                }
                .padding()
            }
            .scrollContentBackground(.hidden)
            .background(Color(dataSource.selectedTheme.backgroundColor)) // кастомный фон для контента
        }
        .ignoresSafeArea() // чтобы не было лишних белых областей
    }
}


#Preview {
    GeometryReader { geometry in
        FiltersSheetView(geometry: geometry)
    }
}
