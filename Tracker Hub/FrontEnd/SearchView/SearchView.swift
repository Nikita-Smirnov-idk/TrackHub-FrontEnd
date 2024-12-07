//
//  MenuView.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 05.12.2024.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @State var yelllowColor = Color(hex: "F5FE6C")
    @State var lightGray = Color(hex: "757575")
    @State var darkGray = Color(hex: "474747")
    @State var isPushedFemale: Bool = false
    @State var isPushedMale: Bool = false

    @State var buttonsText = [
        "Силовые тренировки",
        "Кардио тренировки",
        "Растяжка и гибкость",
        "Сбалансированные тренировки",
        "Единоборства"
    ]
//    @State var plug1 = 0

    var body: some View {
        ZStack {
            darkGray.edgesIgnoringSafeArea(.all)
            VStack {
                GeometryReader { geometry in
                    let geometryWidth = geometry.size.width
                    let geometryHeight = geometry.size.height
                    let geometryFontSize = geometryWidth * 0.03
                    
                    VStack {
                        HStack{
                            Spacer()
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .padding(.leading)
                                    .foregroundColor(yelllowColor)
                                    .scaledToFit()
                                    .font(Font.custom("ReadexPro-Bold", size: geometryFontSize))
                                    .frame(width: geometryWidth * 0.05, height: geometryHeight * 0.05)
                                    
                                Divider()
                                    .frame(width: 2,height: 50)
                                    .background(darkGray)
                                    .frame(width: geometryWidth * 0.05, height: geometryHeight * 0.05)
                                    
                                
                                TextField("Поиск тренеров", text: $searchText)
                                    .padding(.trailing)
                                    .foregroundColor(darkGray)
                                    .padding(.horizontal)
                                    .font(Font.custom("ReadexPro-Bold", size: geometryFontSize))
                                    .multilineTextAlignment(.leading)
                                    .frame(width: geometryWidth * 0.4, height: geometryHeight * 0.05)
                            }
                            .frame(width: geometryWidth * 0.6, height: geometryHeight * 0.05)

                            .background(lightGray)
                            .cornerRadius(45)
                            
                            Image(systemName: "slider.horizontal.3")
                                .padding(.horizontal)
                                .foregroundColor(yelllowColor)
                                .scaledToFit()
                                .frame(width: geometryWidth * 0.1, height: geometryHeight * 0.05)
                                .font(Font.custom("ReadexPro-Bold", size: geometryFontSize))

                                
                            Spacer()

                        }
                        .frame(width: .infinity, height: geometryHeight * 0.05)
                        .padding(2.0)
                        
                        HStack {
                            Spacer()
                            
                            Text("Пол: ")
                                .padding()
                                .background(lightGray)
                                .foregroundColor(darkGray)
                                .cornerRadius(45)
                                .font(Font.custom("ReadexPro-Bold", size: geometryFontSize * 0.8))
                                .frame(height: geometryHeight * 0.05)
                                .padding(.leading)
                                                    
                            Spacer()
                            
                            Text("Женский")
                                .padding()
                                .background(!isPushedFemale ? lightGray : yelllowColor)
                                .foregroundColor(!isPushedFemale ? yelllowColor : lightGray)
                                .cornerRadius(45)
                                .frame(height: geometryHeight * 0.05)
                                .font(Font.custom("ReadexPro-Bold", size: geometryFontSize * 0.8))
                                .onTapGesture {
                                    isPushedFemale.toggle()
                                }
                                 
                            Spacer()
                            
                            Text("Мужской")
                                .padding()
                                .background(!isPushedMale ? lightGray : yelllowColor)
                                .foregroundColor(!isPushedMale ? yelllowColor : lightGray)
                                .cornerRadius(45)
                                .font(Font.custom("ReadexPro-Bold", size: geometryFontSize * 0.8))
                                .frame(height: geometryHeight * 0.05)
                                .padding(.trailing)
                                .onTapGesture {
                                    isPushedMale.toggle()
                                    
                                }
                            
                            Spacer()
                        }
                        .padding([.bottom, .top])
                        
                        var plug1 = false
                        ForEach(0..<buttonsText.count) { i in
                            Button(action: { plug1.toggle() }) {
                                Text(buttonsText[i])
                                    .frame(width: geometryWidth * 0.7, height: geometryHeight * 0.07)
                                    .fixedSize(horizontal: true, vertical: true)
                                    .multilineTextAlignment(.center)
                                    .padding([.bottom, .top])
                                    .foregroundColor(Color(hex: "F5FE6C"))
                                    .background(Color(hex: "757575"))
                                    .font(Font.custom("ReadexPro-Bold", size: geometryFontSize))
                                    
                                    .clipShape(CustomRoundedRectangle(cornerRadius: 45, corners: [.topRight, .bottomLeft]))
                                
                            }
                            .padding([.bottom, .top], 10.0)
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}

#Preview {
    SearchView()
}
