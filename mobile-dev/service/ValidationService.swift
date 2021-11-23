//
//  ValidationService.swift
//  mobile-dev
//
//  Created by Orest on 13.11.2021.
//

import Foundation

class ValidationService {
    static func validate(form: SignUpModel) {
        if form.firstName.isEmpty {
            form.errors["firstName"] = "Invalid first name"
        }
        if form.lastName.isEmpty {
            form.errors["lastName"] = "Invalid last name"
        }
        if !validateEmail(text: form.email) {
            form.errors["email"] = "Invalid email"
        }
        if !validatePhone(text: form.phone) {
            form.errors["phone"] = "Invalid phone"
        }
        if !validatePassword(text: form.password) {
            form.errors["password"] = "Password should have at least 8 symbols"
        }
        if !validateConfirmPassword(password: form.password, confirmPassword: form.confirmPassword) {
            form.errors["passwordConfirmation"] = "Passwords don't match"
        }
     }

     static private func validateEmail(text: String) -> Bool {
         let emailRegex = "[a-zA-Z0-9\\-]+@[a-zA-Z0-9\\-]+\\.[a-zA-Z]{2,10}"
         return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: text)
     }

     static private func validatePhone(text: String) -> Bool {
         let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
         return NSPredicate(format: "SELF MATCHES %@", phoneRegex).evaluate(with: text)
     }

     static private func validatePassword(text: String) -> Bool {
         return text.count >= 8
     }

     static func validateConfirmPassword(password: String, confirmPassword: String) -> Bool {
         return validatePassword(text: password) && (password == confirmPassword)
     }
}
