//
//  WorkoutCardView.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 03.03.2025.
//

import SwiftUI

struct WorkoutCardView: View {
    @StateObject var dataSource = DataSource()
    var geometry: GeometryProxy
    var cardModel: WorkoutCardModel

    // Вынесите повторяющиеся стили в переменные
    private var titleFont: Font {
        Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 16)
    }

    private var secondaryFont: Font {
        Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 13)
    }
    
    var body: some View {
        // В теле View:
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(dataSource.selectedTheme.buttonsBackgroundColor))

            VStack(spacing: 8) { // Упрощенная структура
                // Верхний блок
                VStack(alignment: .leading, spacing: 4) {
                    Text(cardModel.name)
                        .font(titleFont)
                        .foregroundColor(Color(dataSource.selectedTheme.secondaryFontColor))

                    Text(cardModel.description)
                        .font(secondaryFont)
                        .foregroundColor(Color(dataSource.selectedTheme.backgroundColor))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)

                Spacer()

                // Нижний блок
                VStack(alignment: .leading, spacing: 8) {
                    Text("\(cardModel.createdBy) · \(cardModel.createdAt)")
                        .font(secondaryFont)
                        .foregroundColor(Color(dataSource.selectedTheme.secondaryFontColor))

                    HStack {
                        Text(cardModel.isWorkout ? "Тренировка" : "План")
                            .font(secondaryFont)
                            .foregroundColor(Color(dataSource.selectedTheme.secondaryFontColor))

                        Spacer()

                        Button(action: {}) {
                            Text("Добавить")
                                .frame(
                                    width: geometry.size.width * 0.2,
                                    height: geometry.size.height * 0.03)
                                .foregroundColor(Color(dataSource.selectedTheme.buttonsBackgroundColor))
                                .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 10))
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(dataSource.selectedTheme.primaryColor))
                        )
                    }
                }
                .padding(.horizontal)
            }
            .padding(.vertical, 12)
        }
        .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.2)
    }
}


#Preview {
    GeometryReader{ geometry in
        VStack {
            WorkoutCardView(
                geometry: geometry,
                cardModel: WorkoutCardModel(
                    name: "Тренировка плеч",
                    description: "Самая пиздатая тренировк плеч. Вы ахуеете",
                    isWorkout: true,
                    createdBy: "Никита Смирнов",
                    createdAt: "10.01.25")).environmentObject(DataSource())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
