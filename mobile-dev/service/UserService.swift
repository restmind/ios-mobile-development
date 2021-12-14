//
//  UserService.swift
//  mobile-dev
//
//  Created by Orest on 07.12.2021.
//

import Foundation

struct UserService {
    static let userDefaults = UserDefaults.standard
    static let key = "users"
    static private var encoder = JSONEncoder()
    static private var decoder = JSONDecoder()


    static func getAll() -> [User]? {
        guard let allUsers = dataByKey(key: key) else {
            return nil
        }
        return getDecodedUsers(from: allUsers)
        
    }
    
    static func save(newUser: User) {
        do {
            let newUserData = try encoder.encode(newUser)
        guard var savedUsers = (userDefaults.array(forKey: key) as? [Data])
        else {
            return userDefaults.set([newUserData], forKey: key)
        }
            savedUsers.append(newUserData)
            userDefaults.set(savedUsers, forKey: key)
        } catch{
            
        }
    }
    
    static func dataByKey(key: String) -> [Data]? {
         userDefaults.array(forKey: key) as? [Data]
     }
    
    static private func getDecodedUsers(from users: [Data]) -> [User] {
         do {
             return try users.map {
                 user in try decoder.decode(User.self, from: user)
             }
         } catch {
             return []
         }
     }
}
