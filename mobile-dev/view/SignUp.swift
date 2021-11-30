//
//  ContentView.swift
//  mobile-dev
//
//  Created by Orest on 29.09.2021.
//

import SwiftUI

struct SignUp: View {
    @ObservedObject var signUpModel = SignUpModel()
    
    var body: some View {
        VStack {
            SignField(placeholder: SignPlaceholders.firstName.rawValue, text: $signUpModel.firstName, error: signUpModel.errors["firstName"] ?? SignPlaceholders.emptyErrorMessage.rawValue)
            
            SignField(placeholder: SignPlaceholders.lastName.rawValue, text: $signUpModel.lastName, error: signUpModel.errors["lastName"] ?? SignPlaceholders.emptyErrorMessage.rawValue)
            
            SignField(placeholder: SignPlaceholders.email.rawValue, text:
                $signUpModel.email, error: signUpModel.errors["email"] ?? SignPlaceholders.emptyErrorMessage.rawValue)
            
            SignField(placeholder: SignPlaceholders.phone.rawValue, text:
                $signUpModel.phone, error: signUpModel.errors["phone"] ?? SignPlaceholders.emptyErrorMessage.rawValue)
            
            SignField(placeholder: SignPlaceholders.password.rawValue, text: $signUpModel.password, error: signUpModel.errors["password"] ?? SignPlaceholders.emptyErrorMessage.rawValue)
            
            SignField(placeholder: SignPlaceholders.confirmPassword.rawValue, text: $signUpModel.confirmPassword, error: signUpModel.errors["password"] ?? SignPlaceholders.emptyErrorMessage.rawValue)
            
            Spacer()
            
            Button{
                signUpModel.validate()
            }label: {
                Text("Submit")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .font(.headline)
                    .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
            }

        }
        .padding()

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
