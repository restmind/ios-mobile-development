//
//  LikeButton.swift
//  mobile-dev
//
//  Created by Orest on 21.12.2021.
//

import SwiftUI

struct LikeButton: View {
    @State var isLiked: Bool
    @State var image: LikedImageModel
    
    var body: some View {
        Button{
                 isLiked = !isLiked
                if(isLiked == true) {
                    image.isLiked = true
                    ImageService.save(newImage: image)
                } else {
                    image.isLiked = false
                    ImageService.delete(image: image)
                }
             }
             label: {
                 Image(systemName: isLiked ? "heart.fill" : "heart")
                     .foregroundColor(Color.red)
             }
     }
    
}

