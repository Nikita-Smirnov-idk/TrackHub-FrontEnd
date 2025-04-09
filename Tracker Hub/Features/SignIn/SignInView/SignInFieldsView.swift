//
//  SignUpSecurityFields.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 18.02.2025.
//

import SwiftUI

struct SignInFieldsView: View {
    
    let fields = SignInInfo().fields
    let geometry: GeometryProxy
    @Binding var user: SignInUserModel
    @Binding var isValid: Bool
    @ObservedObject var dataChecker: CheckValidSignInData
    
    init(geometry: GeometryProxy,
         user: Binding<SignInUserModel>,
         isValid: Binding<Bool>)
    {
        self.geometry = geometry
        self._user = user
        self._isValid = isValid
        // Инициализируем dataChecker здесь, передав начальные значения
        self.dataChecker = CheckValidSignInData(user: user.wrappedValue)
    }
    
    var formIsValid: Bool {
        return user.email.isValidEmail &&
                user.password.isValidPassword
    }
    
    var fieldBindings: [Binding<String>] {
            [
                $user.email,
                $user.password,
            ]
        }
    
    var body: some View {
        VStack {
            ForEach(0..<fields.count, id: \.self) { index in
                if index == fields.count - 1{
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
        }
        .onChange(of: user) { newValue in
            print("user изменён: \(newValue)")
            print("formIsValid = \(formIsValid)")
            isValid = formIsValid
        }
        .onAppear {
            isValid = formIsValid
        }

    }
}
