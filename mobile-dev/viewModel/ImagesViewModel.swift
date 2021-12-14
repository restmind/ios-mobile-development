//
//  ImageViewModel.swift
//  mobile-dev
//
//  Created by Orest on 12.12.2021.
//

import Foundation

class ImagesViewModel: ObservableObject {
    @Published var images = [ImageMetaData]()
    
    func loadImages() {
        ImageManager.getResponse(action: {response in
            if let images = response {
                self.images = images
            } else {
                self.images = []
            }
        })
    }

 }
