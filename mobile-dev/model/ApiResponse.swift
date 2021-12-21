//
//  Response.swift
//  mobile-dev
//
//  Created by Orest on 12.12.2021.
//

import Foundation


struct ApiResponse: Decodable {
    let error: String
    let total: String
    let books: [ImageMetaData]
}
