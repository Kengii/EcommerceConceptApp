//
//  FilterViewModel.swift
//  EcommerceConceptApp
//
//  Created by Владимир Данилович on 26.12.22.
//

import SwiftUI

final class FilterViewModel: ObservableObject {
    
    @Published var brand: String = "Samsung"
    @Published var selectedPriceMinimum: Int = 0 {
        willSet {
            priceRange = "$\(newValue) - $\(selectedPriceMinimum)"
        }
    }
    
    @Published var selctedPriceMaximum: Int = 10000 {
        willSet {
            priceRange = "$\(selectedPriceMinimum) - $\(newValue)"
        }
    }
    
    @Published var priceRange: String = "$0 - $10000"
    
    let brands = ["Samsung", "Xiaomi", "Apple"]
    
    let priceMinimum = 0
    let priceMaximum = 10_000
}
