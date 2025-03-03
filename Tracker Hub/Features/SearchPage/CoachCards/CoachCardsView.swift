//
//  CoachCardsView.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 08.01.2025.
//

import SwiftUI

struct CoachCardsView: View {
    @EnvironmentObject var dataSource: DataSource

    let coachTable: [Coach] = CoachTable.coachTable
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(spacing: 16) { 
                    ForEach(coachTable.indices, id: \.self) { index in
                        CardView(geometry: geometry, coach: coachTable[index])
                    }
                    .frame(maxWidth: .infinity)
                }

            }
            .simultaneousGesture(DragGesture())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(dataSource.selectedTheme.backgroundColor))
    }
}

struct CardView : View {
    @EnvironmentObject var dataSource: DataSource
    
    let geometry: GeometryProxy
    
    let coach: Coach
    
    @State private var flashOpacity = false
    @State private var flashDuration = 0.13
    
    var body: some View {
        VStack{
            
            Button( action: {
                flashButton()
            }) {
                
                HStack{
                    Spacer()
                    
                    Image(coach.iconName)
                        .resizable() // Делает изображение масштабируемым
                        .frame(width: 91, height: 120)
                        .multilineTextAlignment(.leading)
                        .padding([.bottom, .top])
                                        
                    Text(coach.name)
//                        .frame(width: AdaptiveValue(idealValue: geometry.size.width / 2, minValue: 250, maxValue: 500))
                        .multilineTextAlignment(.leading)

//                        .fixedSize(horizontal: true, vertical: false)
                        .padding([.bottom, .top])
                        .foregroundColor(Color(dataSource.selectedTheme.secondaryFontColor))
                        .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 13))
                    
                    
                }
                .frame(width: AdaptiveValue(idealValue: geometry.size.width / 2, minValue: 250, maxValue: 500), height: 100)
                .background(Color(dataSource.selectedTheme.secondaryBackgroundColor))
                .clipShape(CustomRoundedRectangle(cornerRadius: 45, corners: [.topRight, .bottomLeft, .topLeft, .bottomRight]))
                .opacity(flashOpacity ? 0.1 : 1) // Применяем мигание
                .animation(.easeInOut(duration: flashDuration).repeatCount(1, autoreverses: true), value: flashOpacity)


            }
            .padding([.bottom, .top], 10.0)
            .contentShape(Rectangle())
            .simultaneousGesture(TapGesture())
        }
        
    }
    func flashButton() {
            // Мигание будет происходить при нажатии на кнопку
            flashOpacity.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + flashDuration) {
                flashOpacity.toggle()
            }
    }
                
}

#Preview {
    CoachCardsView().environmentObject(DataSource())
}
