//
//  TextAndAnswers.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 19.01.2025.
//

import SwiftUI

struct TrainerQuestions{
    let pages = [QuestionData(text:  "Какова ваша цель?", answers: ["Увеличить доход", "Упростить работу", "Найти новых клиентов"]),
            QuestionData(text: "Вы только начинаете свою карьеру?", answers: ["Да", "Нет"]),
            QuestionData(text: "Вы хотите видеть подсказки?", answers:  ["Да", "Нет"]),
            QuestionData(text: "Благодарим вас! Желаем приятного пользования нашим приложение", answers: [])
        ]
}

struct ClientQuestions{
    let pages = [QuestionData(text:  "Какова ваша цель?", answers: ["Найти тренера", "Составить план тренировок", "Начать вести здоровый образ жизни"]),
            QuestionData(text: "Вы только начинаете свою карьеру?", answers: ["Да", "Нет"]),
            QuestionData(text: "Вы хотите видеть подсказки?", answers:  ["Да", "Нет"]),
            QuestionData(text: "Благодарим вас! Желаем приятного пользования нашим приложение", answers: [])
        ]
}

//struct TextAndAnswers: EnvironmentObject {
//    @EnvironmentObject var manager = GreetingManager()
//    var pages: [QuestionData] {
//            if manager.isTrainer {
//                return TrainerQuestions().pages
//            } else {
//                return ClientQuestions().pages
//            }
//    }}
