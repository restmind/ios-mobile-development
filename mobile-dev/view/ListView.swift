//
//  ListView.swift
//  mobile-dev
//
//  Created by Orest on 07.12.2021.
//

import SwiftUI

struct ListView: View {
    @State var users: [User]?
    
    
    var body: some View {
        VStack {
            if let userList = users {
                List(userList) { user in
                    HStack {
                        Text("\(user.firstName!) \(user.lastName!)")
                            .fontWeight(.bold)
                        Spacer()
                        Text(user.phone!)
                    }
                }
            } else {
    
            }
        }
        .onAppear(perform: {
            users = UserService.getAll()
            
        })
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
