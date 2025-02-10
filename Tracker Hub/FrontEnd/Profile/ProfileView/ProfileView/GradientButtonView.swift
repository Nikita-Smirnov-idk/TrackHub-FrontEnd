//
//  GradientButtonView.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 09.02.2025.
//

import SwiftUI

struct GradientButtonView: View {
    @EnvironmentObject var dataSourse: DataSource
    var geometry: GeometryProxy
    @State private var animateGradient = false

    var body: some View {
        Button(action: {
            // Действие кнопки
        }) {
            Text("TrackHub++")
                .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 16))
                .foregroundColor(Color(dataSourse.selectedTheme.backgroundColor))
                .frame(width: geometry.size.width * 0.85,
                       height: geometry.size.height * 0.08)
        }
        .background(
            RadialGradient(
                gradient: Gradient(colors: [
                    Color(dataSourse.selectedTheme.buttonsBackgroundColor),
                    Color(dataSourse.selectedTheme.primaryColor)
                ]),
                center: .center,
                startRadius: animateGradient ? 40 : 50,
                endRadius: animateGradient ? 175 : 200
            )
        )
        .cornerRadius(20)
        .padding(.horizontal, 20)
        .onAppear {
            withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                animateGradient.toggle()
            }
        }
        .padding(.bottom)
    }
}
#Preview {
    GeometryReader { geometry in
        GradientButtonView(geometry: geometry).environmentObject(DataSource())
    }
}
