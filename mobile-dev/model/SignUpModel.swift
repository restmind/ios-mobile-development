//
//  SignUpModel.swift
//  mobile-dev
//
//  Created by Orest on 13.11.2021.
//

import Foundation


class SignUpModel: ObservableObject, Identifiable {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var phone: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    var errors = [String: String]()
    

    
    func toEmptyModel() {
        self.firstName = ""
        self.lastName = ""
        self.email = ""
        self.phone = ""
        self.password = ""
        self.confirmPassword = ""
    }
    
    func validate() {
        ValidationService.validate(form: self)
    }

    
}
