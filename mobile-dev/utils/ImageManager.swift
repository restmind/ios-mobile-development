//
//  PhotoManager.swift
//  mobile-dev
//
//  Created by Orest on 12.12.2021.
//

import Foundation
import Alamofire

struct ImageManager {
    private static var API_BASE_URL: String = "https://api.itbook.store/1.0"
    
    static func getResponse(action: @escaping ([ImageMetaData]?) -> Void) {
        AF.request(API_BASE_URL + "/new", method: .get, encoding: JSONEncoding.default)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                            do {
                                if let json = response.data {
                                    let responseDecoded = try JSONDecoder().decode(ApiResponse.self, from: json)
                                     action(responseDecoded.books)
                                }
                            } catch {
                                print(error.localizedDescription)
                            }
                case .failure(let error):
                    print(error)
                }
            }
    }
}
