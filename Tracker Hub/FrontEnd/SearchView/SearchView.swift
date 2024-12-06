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
    @State var isPushed: Bool = false
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
                    
                    VStack {
                        HStack{
                            Spacer()
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .padding(.leading)
                                    .foregroundColor(yelllowColor)
                                    .scaledToFit()
                                    
                                Divider()
                                    .frame(width: 2,height: 50)
                                    .background(darkGray)
                                    
                                
                                TextField("Поиск тренеров", text: $searchText)
                                    .padding(.trailing)
                                    .foregroundColor(darkGray)
                                    .padding(.horizontal)
                                    .font(Font.custom("ReadexPro-Bold", size: 13))
                                    .multilineTextAlignment(.leading)
                            }
                            .frame(width: 231, height: 30)

                            .background(lightGray)
                            .cornerRadius(45)
                            
                            Image(systemName: "slider.horizontal.3")
                                .padding(.trailing)
                                .foregroundColor(yelllowColor)
                                .scaledToFit()
                                
                            Spacer()

                        }
                        .padding()
                        
                        HStack {
                            Spacer()
                            
                            Text("Пол: ")
                                .padding()
                                .background(lightGray)
                                .foregroundColor(darkGray)
                                .cornerRadius(45)
                                .font(Font.custom("ReadexPro-Bold", size: 13))
                            
                            Spacer()
                            
                            Text("Женский")
                                .padding()
                                .background(!isPushed ? lightGray : yelllowColor)
                                .foregroundColor(!isPushed ? yelllowColor : lightGray)
                                .cornerRadius(45)
                                .font(Font.custom("ReadexPro-Bold", size: 13))
                                .onTapGesture {
                                    isPushed.toggle()
                                }
                            
                            Spacer()
                            
                            Text("Мужской")
                                .padding()
                                .background(!isPushed ? lightGray : yelllowColor)
                                .foregroundColor(!isPushed ? yelllowColor : lightGray)
                                .cornerRadius(45)
                                .font(Font.custom("ReadexPro-Bold", size: 13))
                                .onTapGesture {
                                    isPushed.toggle()
                                }
                            
                            Spacer()
                        }
                        .padding()
                        
                        var plug1 = false
                        ForEach(0..<buttonsText.count) { i in
                            Button(action: { plug1.toggle() }) {
                                Text(buttonsText[i])
                                    .fixedSize(horizontal: true, vertical: true)
                                    .frame(width: 228, height: 25)
                                    .multilineTextAlignment(.center)
                                    .padding([.bottom, .top])
                                    .foregroundColor(Color(hex: "F5FE6C"))
                                    .background(Color(hex: "757575"))
                                    .font(Font.custom("ReadexPro-Bold", size: 13))
                                    .clipShape(CustomRoundedRectangle(cornerRadius: 45, corners: [.topRight, .bottomLeft]))
                                
                            }
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
