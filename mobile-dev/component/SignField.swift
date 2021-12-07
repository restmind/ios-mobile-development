//
//  SignField.swift
//  mobile-dev
//
//  Created by Orest on 13.11.2021.
//

import SwiftUI

struct SignField: View {
    var type: SignFieldType = .undefined
    var text: Binding<String> = .constant("")
    var error: String = ""
    
    var body: some View {

        switch type {
        case .password, .confirmPassword:
            SecureField(type.rawValue, text: text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
        case .phone:
            TextField(type.rawValue, text: text)
                .keyboardType(.phonePad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
        case .email:
            TextField(type.rawValue, text: text)
                .keyboardType(.emailAddress)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
        default:
            TextField(type.rawValue, text: text)
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
