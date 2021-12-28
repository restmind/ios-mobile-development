//
//  Photo.swift
//  mobile-dev
//
//  Created by Orest on 12.12.2021.
//

import Foundation

class ImageMetaData: Codable, Identifiable {
    var title: String
    var subtitle: String
    var isbn13: String?
    var price: String
    var image: String
    var url: String?
 }

