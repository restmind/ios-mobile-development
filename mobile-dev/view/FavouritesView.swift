//
//  FavouritesView.swift
//  mobile-dev
//
//  Created by Orest on 21.12.2021.
//

import SwiftUI

struct FavouritesView: View {
    @State var images = ImageService.getAll()!
    var body: some View {
        if images.isEmpty {
            Text("No images found")
        }else {
            Group {
                if #available(iOS 15.0, *) {
                    List(images) { image in
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
                        images = ImageService.getAll()!
                    }
                } else {
                    // Fallback on earlier versions
                }
            
            }

        }
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
    }
}
