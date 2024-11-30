//
//  Questions.swift
//  Tracker Hub
//
//  Created by Никита Смирнов on 28.11.2024.
//

import SwiftUI

struct QuestionsView: View
{
    @EnvironmentObject var dataSource: DataSource
    var index_of_question: Int
    var number_of_questions: Int
    var question: String
    var answers: [String]
    
    var body: some View
    {
        VStack{
            VStack{
                HStack{
                    ForEach((0...number_of_questions-1), id: \.self) {index in
                        Rectangle()
                            .fill(index_of_question == index ?
                                  Color(dataSource.selectedTheme.primaryColor) :
                                Color(dataSource.selectedTheme.secondaryBackgroundColor))
                            .frame(width: 80, height: 5)
                            .cornerRadius(45)
                    }
                }
                Spacer()
                HStack{
                    Text("Back")
                        .font(Font.custom("ReadexPro-Bold", size: 20))
                        .foregroundStyle(Color(dataSource.selectedTheme.buttonsBackgroundColor))
                    Spacer()
                    Text("Skip")
                        .font(Font.custom("ReadexPro-Bold", size: 20))
                        .foregroundStyle(Color(dataSource.selectedTheme.buttonsBackgroundColor))
                }
            }.frame(height: 60)
                .padding([.leading, .trailing], 20)
            VStack{
                Text(question)
                    .font(Font.custom("ReadexPro-Bold", size: 20))
                    .foregroundStyle(Color(dataSource.selectedTheme.primaryColor))
                    .frame(height: 100)
                Spacer()
                        .frame(height: 84)
                ForEach((0...answers.count-1), id: \.self){index in
                    Text(answers[index])
                        .fixedSize(horizontal: true, vertical: true)
                        .multilineTextAlignment(.center)
                        .padding([.bottom, .top])
                        .frame(width: scaleScreen_x(353), height: scaleScreen_y(80))
                        .background(Rectangle().fill(Color(dataSource.selectedTheme.secondaryBackgroundColor))
                            .clipShape(CustomRoundedRectangle(cornerRadius: 45, corners: (index == 0 ? [.bottomLeft, .topRight] : index == answers.count-1 ? [.bottomRight, .topLeft] : [.bottomRight, .topRight]))))
                        .foregroundStyle(Color(dataSource.selectedTheme.primaryColor))
                    if index != answers.count-1{
                        Spacer()
                            .frame(height: 50)
                    }
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding([.leading, .trailing], 20)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(dataSource.selectedTheme.backgroundColor))
    }
}

#Preview {
    QuestionsView(index_of_question: 0, number_of_questions: 4, question: "Какова ваша цель?", answers: ["увеличить доход", "упростить работу", "найти новых клиентов"]).environmentObject(DataSource())
}
