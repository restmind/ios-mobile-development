//
//  User.swift
//  mobile-dev
//
//  Created by Orest on 12.12.2021.
//

import Foundation


class User: Codable, Identifiable {
     var firstName: String?
     var lastName: String?
     var phone: String?
     var email: String?
     var password: String?
    
    init(signUpModel: SignUpModel) {
        self.firstName = signUpModel.firstName
        self.lastName = signUpModel.lastName
        self.phone = signUpModel.phone
        self.email = signUpModel.email
        self.password = signUpModel.password
    }
}
