//
//  Product.swift
//  EcommerceConceptApp
//
//  Created by Владимир Данилович on 25.12.22.
//

import Foundation

struct Product: Decodable {
    let id: Int
    let isNew: Bool?
    let title, subtitle: String
    let picture: URL?
    var pictureData: Data?
    let isBuy: Bool
    
    enum CodingKeys: CodingKey {
        case id
        case isNew
        case title
        case subtitle
        case picture
        case isBuy
    }
    
    init(from decoder: Decoder)  throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.isNew = try container.decode(Bool.self, forKey: .isNew)
        self.title = try container.decode(String.self, forKey: .title)
        self.subtitle = try container.decode(String.self, forKey: .subtitle)
        self.picture = try container.decode(URL.self, forKey: .picture)
        self.isBuy = try container.decode(Bool.self, forKey: .isBuy)
        self.pictureData = nil
        
        if let url = self.picture {
            let data = try? Data(contentsOf: url)
            self.pictureData = data
        }
    }
}

