//
//  PhotoService.swift
//  mobile-dev
//
//  Created by Orest on 21.12.2021.
//

import Foundation

struct ImageService {
    static let imagesDefaults = UserDefaults.standard
    static let key = "images"
    static private var encoder = JSONEncoder()
    static private var decoder = JSONDecoder()
    static var buffImages = getAll()!


    static func getAll() -> [LikedImageModel]? {
        guard let allImages = dataByKey(key: key) else {
            return nil
        }
        return getDecodedImages(from: allImages)
        
    }
    
    static func save(newImage: LikedImageModel) {
        do {
            guard var persisted = imagesDefaults.object(forKey: key) as? [String: Data] else {
                let newImageData = [newImage.image: try encoder.encode(newImage)]
                 return imagesDefaults.set(newImageData, forKey: key)
             }
            
            persisted[newImage.image] = try encoder.encode(newImage)
            buffImages.append(newImage)
            imagesDefaults.set(persisted, forKey: key)
        }
        catch {
            
        }
    }
    
    static func delete(image: LikedImageModel) {
        guard var savedImages = dataByKey(key: key) else {
            return
        }
        savedImages.removeValue(forKey: image.image)
        imagesDefaults.set(savedImages, forKey: key)
        
    }
    
    static func contain(id: String) -> Bool {
        guard let savedImages = dataByKey(key: key) else {
            return false
        }
        return savedImages.keys.contains(id)
    }
    
    static func dataByKey(key: String) -> [String: Data]? {
        imagesDefaults.object(forKey: key) as? [String: Data] ?? [:]
     }
    
    static private func getDecodedImages(from images: [String: Data]) -> [LikedImageModel] {
         do {
             return try images.values.map {
                 image in try decoder.decode(LikedImageModel.self, from: image)
             }
         } catch {
             return []
         }
     }
}
