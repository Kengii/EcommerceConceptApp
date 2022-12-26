//
//  BestSale.swift
//  EcommerceConceptApp
//
//  Created by Владимир Данилович on 26.12.22.
//

import Foundation

struct BestSeler: Decodable {
    let id: Int
    let isFavorites: Bool
    let title: String
    let priceWithoutDiscount, discountPrice: Int
    let picture: URL?
    var pictureData: Data?
    
    enum CodingKeys: CodingKey {
        case id
        case isFavorites
        case title
        case priceWithoutDiscount
        case discountPrice
        case picture
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.isFavorites = try container.decode(Bool.self, forKey: .isFavorites)
        self.title = try container.decode(String.self, forKey: .title)
        self.priceWithoutDiscount = try container.decode(Int.self, forKey: .priceWithoutDiscount)
        self.discountPrice = try container.decode(Int.self, forKey: .discountPrice)
        self.picture = try container.decode(URL.self, forKey: .picture)
        self.pictureData = nil
        if let url = picture {
            let data = try? Data(contentsOf: url)
            pictureData = data
        }
    }
}
