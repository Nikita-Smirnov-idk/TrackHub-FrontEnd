//
//  EdtiProfileSectionGroup.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 10.02.2025.
//

import SwiftUI

struct EdtiProfileSectionGroup: View {
    @StateObject var dataSource = DataSource()
    var geometry: GeometryProxy
    @Binding var hasChanges: Bool
    var sectionList: [EditProfileSection]
    
    // Хранить исходное значение для каждого индекса
    @State private var initialTexts: [Int: String] = [:]
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(sectionList.indices, id: \.self) { index in
                HStack {
                    Text(sectionList[index].title)
                        .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 16))
                        .foregroundStyle(Color(dataSource.selectedTheme.primaryColor))

                    TextField("", text: sectionList[index].titleField)
                        .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 16))
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .foregroundStyle(Color(dataSource.selectedTheme.backgroundColor))
                        
                        // Когда TextField появился первый раз, сохраним его значение
                        .onAppear {
                            // Если у нас еще нет сохранённого значения для этого индекса
                            if initialTexts[index] == nil {
                                initialTexts[index] = sectionList[index].titleField.wrappedValue
                            }
                        }
                        // iOS 15+: два аргумента onChange(of:)
                        .onChange(of: sectionList[index].titleField.wrappedValue) { oldValue, newValue in
                            guard let originalValue = initialTexts[index] else {
                                return
                            }
                            if newValue != originalValue {
                                hasChanges = true
                                print("Изменено c \(originalValue) на \(newValue)")
                            } else {
                                hasChanges = false
                            }
                        }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()

                if index != sectionList.count - 1 {
                    Rectangle()
                        .fill(Color(dataSource.selectedTheme.backgroundColor))
                        .frame(height: 1)
                        .padding(.horizontal)
                }
            }
        }
        .frame(width: geometry.size.width * 0.85)
        .background(Color(dataSource.selectedTheme.buttonsBackgroundColor))
        .cornerRadius(20)
        .padding(.bottom)
    }
}
