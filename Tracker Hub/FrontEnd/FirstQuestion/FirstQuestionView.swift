import SwiftUI

struct FirstQuestionView: View {
    @State var isTrener: Bool = true
    
    var body: some View {
        ZStack {
            Color(hex: "474747").edgesIgnoringSafeArea(.all)
            VStack {
                Rectangle()
                    .fill(Color(hex: "F5FE6C"))
                    .frame(width: 75, height: 5)
                    .cornerRadius(45)
                    .padding()

                Spacer()

                GeometryReader { geometry in
                    let headerWidth: CGFloat = geometry.size.width * 0.8 // Ширина заголовка (80% экрана)
                    let headerFontSize: CGFloat = geometry.size.width * 0.05 // Размер шрифта заголовка
                    let buttonWidth: CGFloat = geometry.size.width * 0.4 // Ширина кнопки (40% экрана)
                    let buttonHeight: CGFloat = geometry.size.height * 0.1 // Высота кнопки (10% экрана)

                    VStack(spacing: 0) {
                        // Заголовок
                        Text("Хочу с вами познакомиться!\nКто вы?")
                            .padding()
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(hex: "F5FE6C"))
                            .font(Font.custom("ReadexPro-Bold", size: headerFontSize))
                            .frame(width: headerWidth, height: geometry.size.height * 0.2) // Адаптивная высота
                            .fixedSize(horizontal: false, vertical: true)

                        Spacer()

                        // Кнопки
                        ZStack {
                            // Первая кнопка
                            Button(action: { isTrener = true }) {
                                Text("Тренер")
                                    .fixedSize(horizontal: true, vertical: true)
                                    .multilineTextAlignment(.center)
                                    .padding([.bottom, .top])
                                    .frame(width: buttonWidth, height: buttonHeight)
                                    .foregroundColor(Color(hex: "F5FE6C"))
                                    .background(Color(hex: "757575"))
                                    .font(Font.custom("ReadexPro-Bold", size: headerFontSize))
                                    .clipShape(CustomRoundedRectangle(cornerRadius: 45, corners: [.topRight, .bottomLeft]))
                            }
                            .position(x: geometry.size.width * 0.3, y: geometry.size.height * 0.3)

                            // Вторая кнопка
                            Button(action: { isTrener = false }) {
                                Text("Клиент")
                                    .fixedSize(horizontal: true, vertical: true)
                                    .multilineTextAlignment(.center)
                                    .padding(.all)
                                    .frame(width: buttonWidth, height: buttonHeight)
                                    .foregroundColor(Color(hex: "F5FE6C"))
                                    .background(Color(hex: "757575"))
                                    .font(Font.custom("ReadexPro-Bold", size: headerFontSize))
                                    .clipShape(CustomRoundedRectangle(cornerRadius: 45, corners: [.topRight, .bottomLeft]))
                            }
                            .position(
                                x: geometry.size.width * 0.3 + buttonWidth,
                                y: geometry.size.height * 0.3 + buttonHeight
                            )
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity) // Заполняет все пространство
                
                Spacer()
            }
        }
    }
}

#Preview {
    FirstQuestionView()
}
