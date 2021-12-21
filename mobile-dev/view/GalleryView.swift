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
        Group{
            if imagesViewModel.images.isEmpty {
                Text("No images found")
            }else {
                List(imagesViewModel.images) { image in
                    VStack{
                        Text("\(image.title)")
                            .font(.title)
                            .fontWeight(.bold)
                        ImageView(imageUrl: image.image!)
                        Text("\(image.price!)")
                            .padding(.bottom)
                    }
            }
        }
        }
        .onAppear {
            imagesViewModel.loadImages()
        }
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
