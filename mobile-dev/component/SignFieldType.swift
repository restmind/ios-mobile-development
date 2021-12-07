//
//  Constants.swift
//  mobile-dev
//
//  Created by Orest on 13.11.2021.
//

import Foundation


enum SignFieldType: String {
    case firstName = "First Name"
    case lastName = "Last Name"
    case email = "Email"
    case phone = "Phone"
    case password = "Password"
    case confirmPassword = "Confirm Password"
    case undefined = ""
    
    static let allValues = [firstName, lastName, email, phone, password, confirmPassword, undefined]
}
