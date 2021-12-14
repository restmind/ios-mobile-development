//
//  NavigationView.swift
//  mobile-dev
//
//  Created by Orest on 07.12.2021.
//

import SwiftUI

struct NavigateView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                SignUpView()
                
                HStack {
                    NavigationLink(destination: ListView()){
                        Text(Constants.contactsTitle)
                    }
                    
                    Spacer()
                    NavigationLink(destination: GalleryView()){
                        Text(Constants.galleryTitle)
                    }
                    
                }
                .padding()
                .navigationTitle(Constants.navTitle)
            }
        }
        .navigationTitle(Constants.navTitle)
    }
    enum Constants {
        static let contactsTitle = "Contacts"
        static let navTitle = "Cool app"
        static let galleryTitle = "Gallery"
    }
}

struct NavigateView_Previews: PreviewProvider {
    static var previews: some View {
        NavigateView()
    }
}
