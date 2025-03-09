//
//  CardView.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 06.03.2025.
//

import SwiftUI

struct CardView<Item: CardRepresentable>: View{
    @StateObject var dataSource = DataSource()
    var geometry: GeometryProxy
    var cardModel: Item
    var onAdd: (() -> Void)?
    var onEdit: (() -> Void)?
    var onTap: (() -> Void)?

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
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text(cardModel.name)
                            .font(titleFont)
                            .foregroundColor(Color(dataSource.selectedTheme.secondaryFontColor))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        if let onEdit = onEdit {
                            Image(systemName: "pencil")
                                .resizable()
                                .foregroundStyle(Color(dataSource.selectedTheme.primaryColor))
                                .frame(width: geometry.size.width * 0.04, height: geometry.size.width * 0.04)
                                .onTapGesture {
                                    onEdit()
                                }

                        }
                    }

                    Text(cardModel.description)
                        .font(secondaryFont)
                        .foregroundColor(Color(dataSource.selectedTheme.secondaryFontColor))
                        
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)

                Spacer()

                // Нижний блок
                VStack(alignment: .leading, spacing: 8) {
                    Text("\(cardModel.createdBy) · \(cardModel.createdAt)")
                        .font(secondaryFont)
                        .foregroundColor(Color(dataSource.selectedTheme.subFontColor))

                    HStack {
                        Text(cardModel.cardType == .workout ? "Тренировка" : "План")
                            .font(secondaryFont)
                            .foregroundColor(Color(dataSource.selectedTheme.subFontColor))

                        Spacer()
                        
                        if let onAdd = onAdd {
                            Button(action: onAdd ) {
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
                }
                .padding(.horizontal)
            }
            .padding(.vertical, 12)
        }
        .frame(width: geometry.size.width * 0.82, height: geometry.size.height * 0.23)
        .contentShape(Rectangle())
        .onTapGesture {
            print("Вся карточка нажата")
            if let onTap = onTap {
                onTap()
            }
        }
    }
}


#Preview {
        
    GeometryReader{ geometry in
        VStack {            
            CardView(
                geometry: geometry,
                cardModel: Plan(id: 0, name: "Тренировка ног", description: "крутая выебонская сасная тренирочока ощцвысмывмщывмфтлмотялмтялмитялосмлоямоля", createdBy: "Николаев Роман", createdAt: "10.10.20"),
                onAdd: { print("tapped") },
                onEdit: { print("edited") })
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
