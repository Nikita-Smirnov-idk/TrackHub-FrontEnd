import SwiftUI


/// View for first question to define who is the user
/// - Parameters:
///   - dataSource: Source with static data
///   - isTrener: Whom was chosen:  true -> trainer / false -> client
struct FirstQuestionView: View {
    @EnvironmentObject var dataSource: DataSource
    @EnvironmentObject var manager: GreetingManager
    
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

                VStack(spacing: 0) {
                    // Заголовок
                    Text("Хочу с вами познакомиться!\nКто вы?")
                        .padding()
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
                        .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: RelativeFontSizeType2(size: 16, func_coef: 5, plus_value: 2.6, divider_value: 3.9)))
                        .frame(width: headerWidth, height: geometry.size.height * 0.2) // Адаптивная высота
                        .fixedSize(horizontal: false, vertical: true)
                        
                    Spacer()
                        .frame(height: AdaptiveValue(idealValue: geometry.size.height * 0.2, minValue: 100, maxValue: 300))

                    // Кнопки
                    Grid(horizontalSpacing: 0, verticalSpacing: 0) {
                        GridRow {
                            FirstQuestionButton(
                                title: "Тренер",
                                action: {
                                    manager.isFirstQuestionShown = false
                                    manager.isTrainer = true
                                    print("Trainer")
                                },
                                width: AdaptiveValue(idealValue: geometry.size.width / 3, minValue: 150, maxValue: 300),
                                height: AdaptiveValue(idealValue: geometry.size.height / 11, minValue: 60, maxValue: 70),
                                theme: dataSource.selectedTheme
                            )
                            Color.clear.gridCellUnsizedAxes([.horizontal, .vertical])
                        }
                        GridRow {
                            Color.clear.gridCellUnsizedAxes([.horizontal, .vertical])
                            FirstQuestionButton(
                                title: "Клиент",
                                action: {
                                    manager.isFirstQuestionShown = false
                                    manager.isTrainer = false
                                    print("Client")
                                },
                                width: AdaptiveValue(idealValue: geometry.size.width / 3, minValue: 150, maxValue: 300),
                                height: AdaptiveValue(idealValue: geometry.size.height / 11, minValue: 60, maxValue: 70),
                                theme: dataSource.selectedTheme
                            )
                        }

                    }
                    Spacer()
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
