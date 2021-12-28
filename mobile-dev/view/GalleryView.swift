//
//  GalleryView.swift
//  mobile-dev
//
//  Created by Orest on 12.12.2021.
//

import SwiftUI

struct GalleryView: View {
    @ObservedObject var imagesViewModel = ImagesViewModel()

    
    var body: some View {
        VStack {
        Group {
            if imagesViewModel.images.isEmpty {
                Text("No images found")
            }else {
                if #available(iOS 15.0, *) {
                    List(imagesViewModel.images) { image in
                        VStack{
                            Text("\(image.title)")
                                .font(.title)
                                .fontWeight(.bold)
                            ImageView(imageUrl: image.image)
                            HStack {
                                var newImg = LikedImageModel(title: image.title, subtitle: image.subtitle, price: image.price, image: image.image, isLiked: ImageService.contain(id: image.image))
                                
                                LikeButton(isLiked: newImg.isLiked, image: newImg)
                                
                                Spacer()
                                
                                Text("\(image.price)")
                            }.padding(.bottom)
                            
                        }
                    }
                    .refreshable {
                        imagesViewModel.loadImages()
                    }
                }
        }
        }
        .onAppear {
            imagesViewModel.loadImages()
        }
        HStack {
            Spacer()
            
            NavigationLink(destination: FavouritesView(favouritesImages: ImageService.buffImages)) {
                 Text("Favourites")
             }
        }
        .padding()
    }
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
