//
//  ContentView.swift
//  mobile-dev
//
//  Created by Orest on 29.09.2021.
//

import SwiftUI

struct SignUpView: View {
    @ObservedObject var signUpModel = SignUpModel()
    enum Constant {
        static let emptyError = ""
    }
    
    var body: some View {
        VStack {
            SignField(type: .firstName, text: $signUpModel.firstName, error: signUpModel.errors["firstName"] ?? Constant.emptyError)
            
            SignField(type: .lastName, text: $signUpModel.lastName, error: signUpModel.errors["lastName"] ?? Constant.emptyError)
            
            SignField(type: .email, text:
                $signUpModel.email, error: signUpModel.errors["email"] ?? Constant.emptyError)
            
            SignField(type: .phone, text:
                $signUpModel.phone, error: signUpModel.errors["phone"] ?? Constant.emptyError)
            
            SignField(type: .password, text: $signUpModel.password, error: signUpModel.errors["password"] ?? Constant.emptyError)
            
            SignField(type: .confirmPassword, text: $signUpModel.confirmPassword, error: signUpModel.errors["password"] ?? Constant.emptyError)
            
            Spacer()
            
            Button{
                signUpModel.validate()
                if (signUpModel.errors.isEmpty) {
                    let newUser = User(signUpModel: signUpModel)
                    UserService.save(newUser: newUser)
                    signUpModel.toEmptyModel()
                }
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
        SignUpView()
    }
}
