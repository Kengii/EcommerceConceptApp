//
//  HomeData.swift
//  EcommerceConceptApp
//
//  Created by Владимир Данилович on 25.12.22.
//

import Foundation

struct HomeData: Decodable {
    let homeStore: [Product]
    let bestSeller: [BestSeler]
}
