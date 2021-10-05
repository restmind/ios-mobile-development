//
//  ContentView.swift
//  mobile-dev
//
//  Created by Orest on 29.09.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .font(.largeTitle)
            .fontWeight(.light)
            .foregroundColor(Color.red)
            .padding()
            .onAppear {
                print("Hello World")
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
