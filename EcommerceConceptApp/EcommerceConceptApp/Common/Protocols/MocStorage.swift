//
//  MocStorage.swift
//  EcommerceConceptApp
//
//  Created by Владимир Данилович on 27.12.22.
//

import Foundation
import Combine

protocol Storable {
    func addToCart(_ product: ProductDetail)
    func removeFromCart(_ product: ProductDetail)
}

class MocStorage: Storable {
    private init() {}
    
    static let shared = MocStorage()
    
    @Published var count = 0
    
    var cart: [ProductDetail] = []
    
    func addToCart(_ product: ProductDetail) {
        cart.append(product)
        count += 1
    }
    
    func removeFromCart(_ product: ProductDetail) {
        if let index = cart.firstIndex(where: { $0.id == product.id}) {
            cart.remove(at: index)
            count -= 1
        }
    }
}
