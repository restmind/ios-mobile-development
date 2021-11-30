//
//  SignField.swift
//  mobile-dev
//
//  Created by Orest on 13.11.2021.
//

import SwiftUI

struct SignField: View {
    var placeholder: String = ""
    var text: Binding<String> = .constant("")
    var error: String = ""
    
    var body: some View {

        switch placeholder {
        case SignPlaceholders.password.rawValue, SignPlaceholders.confirmPassword.rawValue:
            SecureField(placeholder, text: text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
        case SignPlaceholders.phone.rawValue:
            TextField(placeholder, text: text)
                .keyboardType(.phonePad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
        case SignPlaceholders.email.rawValue:
            TextField(placeholder, text: text)
                .keyboardType(.emailAddress)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
        default:
            TextField(placeholder, text: text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
        }
        
        Text(error)
            .foregroundColor(.red)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}


struct SignField_Previews: PreviewProvider {
    static var previews: some View {
        SignField()
    }
}
