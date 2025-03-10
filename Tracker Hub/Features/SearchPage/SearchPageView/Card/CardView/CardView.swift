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
    var onDelete: (() -> Void)?

    private var computedDestination: AnyView {
        if let workout = cardModel as? Workout {
            return AnyView(WorkoutFullScreenView(workout: workout))
        } else if let plan = cardModel as? Plan {
            return AnyView(PlanFullScreenView(plan: plan))
        } else if let exercise = cardModel as? Exercise {
            return AnyView(ExerciseFullScreenView(exercise: exercise))
        }
        return AnyView(EmptyView())
    }
    // Вынесите повторяющиеся стили в переменные
    private var titleFont: Font {
        Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 16)
    }

    private var secondaryFont: Font {
        Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 13)
    }
    
    var body: some View {
        // В теле View:
        NavigationLink(destination: computedDestination){
            ZStack(alignment: .top) {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(dataSource.selectedTheme.buttonsBackgroundColor))
                
                VStack(spacing: 8) { // Упрощенная структура
                    // Верхний блок
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Text(cardModel.name)
                                .font(titleFont)
                                .foregroundColor(Color(dataSource.selectedTheme.secondaryFontColor))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            if onEdit != nil || onDelete != nil {
                                Menu{
                                    if let onEdit = onEdit {
                                        Button("Изменить") { onEdit() }
                                    }
                                    
                                    if let onDelete = onDelete {
                                        Button("Удалить") { onDelete() }
                                    }
                                } label: {
                                    Image(systemName: "pencil")
                                        .resizable()
                                        .foregroundStyle(Color(dataSource.selectedTheme.primaryColor))
                                        .frame(width: geometry.size.width * 0.04, height: geometry.size.width * 0.04)
                                }
                            }
                        }
                        Text(cardModel.description)
                            .font(secondaryFont)
                            .foregroundColor(Color(dataSource.selectedTheme.secondaryBackgroundColor))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    // Нижний блок
                    VStack(alignment: .leading, spacing: 8) {
                        Text("\(cardModel.createdBy.name) · \(String(cardModel.createdAt.prefix(10)))") 
                            .font(secondaryFont)
                            .foregroundColor(Color(dataSource.selectedTheme.secondaryFontColor))
                        
                        HStack {
                            Text({
                                switch cardModel.cardType {
                                case .workout:
                                    return "Тренировка"
                                case .plan:
                                    return "План"
                                case .exercise:
                                    return "Упражнение"
                                }
                            }())
                            .font(secondaryFont)
                            .foregroundColor(Color(dataSource.selectedTheme.secondaryFontColor))
                            
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
            .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.2)
            .contentShape(Rectangle())
            .tint(Color(dataSource.selectedTheme.primaryColor))
        }
    }
}


//#Preview {
//        
//    GeometryReader{ geometry in
//        VStack {            
//            CardView(
//                geometry: geometry,
//                cardModel: Plan(id: 0, name: "Тренировка ног", description: "крутая выебонская сасная тренирочока ощцвысмывмщывмфтлмотялмтялмитялосмлоямоля", createdBy: "Николаев Роман", createdAt: "10.10.20"),
//                onAdd: { print("tapped") },
//                onEdit: { print("edited") })
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//    }
//}
