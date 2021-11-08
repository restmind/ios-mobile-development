//
//  ContentView.swift
//  mobile-dev
//
//  Created by Orest on 29.09.2021.
//

import SwiftUI

struct ContentView: View {
    @State var userName = ""
    @State var text = ""
    
    var body: some View {
        VStack {
            TextField("Your name", text: $userName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
            Spacer()
            
            Text(text)
            
            Spacer()
            
            Button{
                if userName.count > 0 {
                    text = "Hello " + userName + "!"
                }
                else {
                    text = ""
                }
            }label: {
                Text("Say Hello")
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
        ContentView()
    }
}
