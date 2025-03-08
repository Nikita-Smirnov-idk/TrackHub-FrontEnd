//
//  CustomToggleView.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 20.01.2025.
//

import SwiftUI

struct CustomToggleStyle: ToggleStyle {
    @StateObject var dataSource = DataSource()
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
                .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 16))

            Spacer()

            RoundedRectangle(cornerRadius: 20)
                .fill(configuration.isOn ? Color(dataSource.selectedTheme.primaryColor) : Color(dataSource.selectedTheme.secondaryBackgroundColor))
                .frame(width: 50, height: 30)
                .overlay(
                    Circle()
                        .fill(configuration.isOn ? Color(dataSource.selectedTheme.secondaryFontColor) : Color(dataSource.selectedTheme.buttonsBackgroundColor))
                        .padding(2)
                        .offset(x: configuration.isOn ? 10 : -10)
                        .animation(.easeInOut(duration: 0.2), value: configuration.isOn)
                )
                .onTapGesture {
                    configuration.isOn.toggle()
                }
        }
    }
}

struct StyledToggleView: View {
    @State private var isOn: Bool = false

    var body: some View {
        GeometryReader{ geometry in
            Toggle("Styled Toggle", isOn: $isOn)
                .toggleStyle(CustomToggleStyle())
                .padding()
        }
    }
}

#Preview {
    StyledToggleView().environmentObject(DataSource())
}
