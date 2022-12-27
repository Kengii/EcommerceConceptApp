//
//  Basket.swift
//  EcommerceConceptApp
//
//  Created by Владимир Данилович on 27.12.22.
//

import Foundation

struct Basket: Codable {
    let basket: [BasketItem]
    let delivery, id: String
    let total: Int
}

struct BasketItem: Codable {
    let id: Int
    let images: URL?
    var imageData: Data?
    let price: Int
    let title: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.images = try container.decode(URL.self, forKey: .images)
        self.price = try container.decode(Int.self, forKey: .price)
        self.title = try container.decode(String.self, forKey: .title)
        
        if let images {
            let data = try? Data(contentsOf: images)
            self.imageData = data
        }
    }
}
