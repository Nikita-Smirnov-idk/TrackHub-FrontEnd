import SwiftUI


/// View for first question to define who is the user
/// - Parameters:
///   - dataSource: Source with static data
///   - isTrener: Whom was chosen:  true -> trainer / false -> client
struct FirstQuestionView: View {
    @EnvironmentObject var dataSource: DataSource
    @State var isTrener: Bool = true
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color(dataSource.selectedTheme.primaryColor))
                .frame(width: 75, height: 5)
                .cornerRadius(45)
                .padding()

            Spacer()

            GeometryReader { geometry in
                let headerWidth: CGFloat = geometry.size.width * 0.8 // Ширина заголовка (80% экрана)
                let buttonWidth: CGFloat = geometry.size.width * 0.45 // Ширина кнопки (40% экрана)
                let buttonHeight: CGFloat = geometry.size.height * 0.09 // Высота кнопки (10% экрана)

                VStack(spacing: 0) {
                    // Заголовок
                    Text("Хочу с вами познакомиться!\nКто вы?")
                        .padding()
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
                        .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: RelativeFontSize(16)))
                        .frame(width: headerWidth, height: geometry.size.height * 0.2) // Адаптивная высота
                        .fixedSize(horizontal: false, vertical: true)

                    Spacer()

                    // Кнопки
                    Grid(horizontalSpacing: 0, verticalSpacing: 0) {
                        GridRow{
                            // Первая кнопка
                            Button(action: { isTrener = true }) {
                                Text("Тренер")
                                    .fixedSize(horizontal: true, vertical: true)
                                    .multilineTextAlignment(.center)
                                    .padding([.bottom, .top])
                                    .frame(width: buttonWidth, height: buttonHeight)
                                    .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
                                    .background(Color(dataSource.selectedTheme.secondaryBackgroundColor))
                                    .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: RelativeFontSize(13)))
                                    .clipShape(CustomRoundedRectangle(cornerRadius: 45, corners: [.topRight, .bottomLeft]))
                            }
                            Color.clear.gridCellUnsizedAxes([.horizontal, .vertical])
                        }
                        GridRow(){
                            Color.clear.gridCellUnsizedAxes([.horizontal, .vertical])
                            // Вторая кнопка
                            Button(action: { isTrener = false }) {
                                Text("Клиент")
                                    .fixedSize(horizontal: true, vertical: true)
                                    .multilineTextAlignment(.center)
                                    .padding(.all)
                                    .frame(width: buttonWidth, height: buttonHeight)
                                    .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
                                    .background(Rectangle().fill(Color(dataSource.selectedTheme.secondaryBackgroundColor))
                                        .clipShape(CustomRoundedRectangle(cornerRadius: 45, corners: [.topRight, .bottomLeft])))
                                    .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: RelativeFontSize(13)))
                            }
                        }
                    }
                    Spacer()
                        .frame(height: geometry.size.height * 0.4)
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity) // Заполняет все пространство
            
            Spacer()
        }
        .background(Color(dataSource.selectedTheme.backgroundColor))
        .dynamicTypeSize(DynamicTypeSize.large...DynamicTypeSize.accessibility2)
    }
}

#Preview {
    FirstQuestionView().environmentObject(DataSource())
}
