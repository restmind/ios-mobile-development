//
//  ImageModel.swift
//  mobile-dev
//
//  Created by Orest on 12.12.2021.
//

import Foundation
import UIKit

class ImageModel: ObservableObject {
    @Published var image: UIImage

    init(imageURL: String) {
        let url = URL(string: imageURL)
        self.image = UIImage(systemName: Constants.imagePlaceholderName)!
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.global().async { [weak self] in
                self?.image = UIImage(data: data!)!
            }
        }
    }
    
    enum Constants {
        static let imagePlaceholderName = "photo.fill"
    }
}
