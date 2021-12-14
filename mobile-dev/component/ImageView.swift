//
//  ImageView.swift
//  mobile-dev
//
//  Created by Orest on 12.12.2021.
//

import SwiftUI

struct ImageView: View {
    
    @ObservedObject var imageModel: ImageModel

     init(imageUrl: String) {
         self.imageModel = ImageModel(imageURL: imageUrl)
     }

     var body: some View {
         Image(uiImage: imageModel.image)
        .resizable()
        .aspectRatio(contentMode: .fit)
         
     }
 }

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        let imageUrl = "https://itbook.store/img/books/9781617294136.png"
                ImageView(imageUrl: imageUrl)
    }
}
