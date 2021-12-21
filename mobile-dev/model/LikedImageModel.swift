//
//  LikedImageModel.swift
//  mobile-dev
//
//  Created by Orest on 21.12.2021.
//

import Foundation

class LikedImageModel: Codable, Identifiable {
    var title: String
    var subtitle: String
    var price: String
    var image: String
    var isLiked: Bool
    
    init(title: String, subtitle: String, price: String, image: String, isLiked: Bool) {
        self.title = title
        self.subtitle = subtitle
        self.price = price
        self.image = image
        self.isLiked = isLiked
    }
 }
