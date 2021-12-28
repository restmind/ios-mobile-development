//
//  FavouritesView.swift
//  mobile-dev
//
//  Created by Orest on 21.12.2021.
//

import SwiftUI

struct FavouritesView: View {
    @State var favouritesImages: [LikedImageModel]
    var body: some View {
            Group {
                if #available(iOS 15.0, *) {
                    List(favouritesImages) { image in
                        VStack{
                            Text("\(image.title)")
                                .font(.title)
                                .fontWeight(.bold)
                            ImageView(imageUrl: image.image)
                            HStack {
                                LikeButton(isLiked: ImageService.contain(id: image.image), image: image)
                                
                                Spacer()
                                
                                Text("\(image.price)")
                            }.padding(.bottom)
                            
                        }
                    }.refreshable {
                        ImageService.buffImages = ImageService.getAll()!
                        favouritesImages = ImageService.buffImages
                        
                    }
                }
            }
            .onAppear {
                ImageService.buffImages = ImageService.getAll()!
                favouritesImages = ImageService.buffImages
            }

        }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView(favouritesImages: ImageService.buffImages)
    }
}
