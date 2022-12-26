//
//  ProductDetail.swift
//  EcommerceConceptApp
//
//  Created by Владимир Данилович on 26.12.22.
//

import Foundation

struct ProductDetail: Decodable {
    let cpu, camera: String
    let capacity, color: [String]
    let id: String
    let images: [URL]
    var imagesData: [Data?] = []
    let isFavorites: Bool
    let price: Int
    let rating: Double
    let sd, ssd, title: String
    
    enum CodingKeys: String, CodingKey {
        case cpu = "CPU"
        case camera, capacity, color, id, images, isFavorites, price, rating, sd, ssd, title
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cpu = try container.decode(String.self, forKey: .cpu)
        self.camera = try container.decode(String.self, forKey: .camera)
        self.capacity = try container.decode([String].self, forKey: .capacity)
        self.color = try container.decode([String].self, forKey: .color)
        self.id = try container.decode(String.self, forKey: .id)
        self.images = try container.decode([URL].self, forKey: .images)
        self.isFavorites = try container.decode(Bool.self, forKey: .isFavorites)
        self.price = try container.decode(Int.self, forKey: .price)
        self.rating = try container.decode(Double.self, forKey: .rating)
        self.sd = try container.decode(String.self, forKey: .sd)
        self.ssd = try container.decode(String.self, forKey: .ssd)
        self.title = try container.decode(String.self, forKey: .title)
        
        images.forEach { url in
            let data = try? Data(contentsOf: url)
            imagesData.append(data)
        }
    }
    
    init() {
        self.cpu = ""
        self.camera = ""
        self.capacity = []
        self.color = []
        self.id = ""
        self.images = []
        self.isFavorites = false
        self.price = 0
        self.rating = 0
        self.sd = ""
        self.ssd = ""
        self.title = ""
    }
}
