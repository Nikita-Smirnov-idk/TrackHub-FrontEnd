//
//  Questions.swift
//  Tracker Hub
//
//  Created by Никита Смирнов on 28.11.2024.
//

//import SwiftUI
//
//
//
///// View for main greeting pages with some questions about goals
///// and other important questions
///// - Parameters:
/////   - dataSource: Source with static data
/////   - index_of_question: index of current chosen question
/////   - number_of_questions: number of all questions
/////   - answers: All possible answers
//struct QuestionsView: View
//{
//    @EnvironmentObject var dataSource: DataSource
////    @EnvironmentObject var manager: QuestionsManager
//    var index_of_question: Int
//    var number_of_questions: Int
//    var question: String
//    var answers: [String]
//    
//    var body: some View
//    {
//        GeometryReader{proxy in
//            VStack{
//                VStack{
//                    HStack{
//                        ForEach((0...number_of_questions-1), id: \.self) {index in
//                            Rectangle()
//                                .fill(index_of_question == index ?
//                                      Color(dataSource.selectedTheme.primaryColor) :
//                                        Color(dataSource.selectedTheme.secondaryBackgroundColor))
//                                .frame(width: 0.9 * (proxy.size.width-40)/CGFloat( number_of_questions), height: 5)
//                                .cornerRadius(45)
//                        }
//                    }
//                    Spacer()
//                    HStack{
//                        Button {
//                        } label: {
//                            Text("Back")
//                                .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 16))
//                                .foregroundStyle(Color(dataSource.selectedTheme.buttonsBackgroundColor))
//                        }
//                        Spacer()
//                        Button {
//                            withAnimation(.easeInOut(duration: 4)) {
//                                
//                            }
//                        } label: {
//                            Text("Skip")
//                                .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 16))
//                                .foregroundStyle(Color(dataSource.selectedTheme.buttonsBackgroundColor))
//                        }
//                    }
//                }.frame(height: 60)
//                    .padding([.leading, .trailing], 20)
//                VStack{
//                    Text(question)
//                        .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 16))
//                        .foregroundStyle(Color(dataSource.selectedTheme.primaryColor))
//                        .frame(height: 100)
//                    Spacer()
//                        .frame(height: 84)
//                    ForEach((0...answers.count-1), id: \.self){index in
//                        Button {
//                            // code for action of button
//                        } label: {
//                            Text(answers[index])
//                                .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 16))
//                                .fixedSize(horizontal: true, vertical: true)
//                                .multilineTextAlignment(.center)
//                                .padding([.bottom, .top])
//                                .frame(minWidth: 300,
//                                       idealWidth: proxy.size.width/1.5,
//                                       maxWidth: 600,
//                                       minHeight: 60,
//                                       idealHeight: proxy.size.height,
//                                       maxHeight: 120
//                                )
//                                .frame(
//                                    width: AdaptiveValue(idealValue:   proxy.size.width/1.75, minValue: 300, maxValue: 450),
//                                    height:
//                                        AdaptiveValue(idealValue: proxy.size.height/10, minValue: 60, maxValue: 80)
//                                )
//                                .background(Rectangle().fill(Color(dataSource.selectedTheme.secondaryBackgroundColor))
//                                    .clipShape(CustomRoundedRectangle(cornerRadius: 45, corners: (index == 0 ? [.bottomLeft, .topRight] : index == answers.count-1 ? [.bottomRight, .topLeft] : [.bottomRight, .topRight]))))
//                                .foregroundStyle(Color(dataSource.selectedTheme.primaryColor))
//
//                        }
//                        if index != answers.count-1{
//                            Spacer()
//                                .frame(height: 50)
//                        }
//                    }
//                    Spacer()
//                }
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                .padding([.leading, .trailing], 20)
//                
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(Color(dataSource.selectedTheme.backgroundColor))
//            .dynamicTypeSize(DynamicTypeSize.large...DynamicTypeSize.accessibility2)
//        }
//    }
//}
//
//#Preview {
//    QuestionsView(index_of_question: 0, number_of_questions: 4, question: "Какова ваша цель?", answers: ["увеличить доход", "упростить работу", "найти новых клиентов"]).environmentObject(DataSource())
//}

import SwiftUI

struct QuestionView: View {
    @State var page: QuestionData
    @EnvironmentObject var dataSource: DataSource
    @Binding var selectedPages: Int

    var body: some View {
        GeometryReader { geometry in
            let headerWidth = geometry.size.width * 0.8

            VStack(spacing: 20) {
                // Заголовок
                Text(page.text)
                    .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 16))
                    .padding()
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
                    .font(.title2)

                    .frame(width: headerWidth, height: geometry.size.height * 0.2)
                    .fixedSize(horizontal: false, vertical: true)
                
                // Кнопки
                ForEach(0..<page.answers.count, id: \.self) { index in
                    AnswerButton(
                        index: index,
                        text: page.answers[index],
                        answers: page.answers,
                        geometry: geometry,
                        action: { selectedPages += 1 }
                    )
                }

                Spacer()
                
//                Image("AddPlug")
//                    .resizable() // Делает изображение масштабируемым
//                    .frame(width: 91, height: 120)
//                    .multilineTextAlignment(.leading)
//                    .padding([.bottom, .top])
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding([.leading, .trailing], 16)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(dataSource.selectedTheme.backgroundColor))
        .dynamicTypeSize(.large...DynamicTypeSize.accessibility2)
    }
}

#Preview {
    QuestionView(
        page: QuestionData(
            text: "Какова ваша цель?",
            answers: ["Увеличить доход", "Упростить работу", "Найти новых клиентов"]
        ),
        selectedPages: .constant(0)
    )
    .environmentObject(DataSource())
}
