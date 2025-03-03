//
//  SignUpSecurityFields.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 18.02.2025.
//

import SwiftUI

struct SignUpFieldsView: View {
    
    let fields = SignUpInfo().fields
    let geometry: GeometryProxy
    @Binding var user: SignUpUserModel
    @State var repeatPassword: String = ""
    @Binding var isValid: Bool
    @ObservedObject var dataChecker: CheckValidSignUpData

    init(geometry: GeometryProxy,
         user: Binding<SignUpUserModel>,
             isValid: Binding<Bool>)
    {
        self.geometry = geometry
        self._user = user
        self._isValid = isValid
        // Инициализируем dataChecker здесь, передав начальные значения
        self.dataChecker = CheckValidSignUpData(user: user.wrappedValue, repeatPassword: "")
    }
    
    var formIsValid: Bool {
        return !user.firstName.isEmpty &&
                !user.lastName.isEmpty &&
               user.email.isValidEmail &&
                user.password.isValidPassword &&
               user.password == repeatPassword
    }
    
    var fieldBindings: [Binding<String>] {
            [
                $user.firstName,
                $user.lastName,
                $user.email,
                $user.password,
                $repeatPassword
            ]
        }
    
    var body: some View {
        VStack{
            ForEach(0..<fields.count, id: \.self) { index in
                if index == fields.count - 1 || index == fields.count - 2{
                    SecurityFieldView(geometry: geometry, backgroundText: fields[index].fieldText, index: index, fieldTextInfo: fieldBindings[index])
                }
                else {
                    TextFieldView(geometry: geometry, backgroundText: fields[index].fieldText, index: index, fieldTextInfo: fieldBindings[index])
                }
            }
            
            if let emailMessage = dataChecker.emailValidationMessage {
                Text(emailMessage)
                    .foregroundColor(.red)
                    .font(.caption)
                    .multilineTextAlignment(.center)

            }
            
            if let passwordMessage = dataChecker.passwordValidationMessage {
                Text(passwordMessage)
                    .foregroundColor(.red)
                    .font(.caption)
                    .multilineTextAlignment(.center)

            }
            
            if repeatPassword != user.password {
                Text("Пароли не совпадают")
                    .foregroundColor(.red)
                    .font(.caption)
                    .multilineTextAlignment(.center)
            }
            
            
        }
        .onChange(of: user) { newValue in
            print("user изменён: \(newValue)")
            print("formIsValid = \(formIsValid)")
            isValid = formIsValid
        }
        .onChange(of: repeatPassword) { newValue in
            print("repeatPassword изменён: \(newValue)")
            print("formIsValid = \(formIsValid)")
            isValid = formIsValid
        }
        .onAppear {
            isValid = formIsValid
        }

    }
}
