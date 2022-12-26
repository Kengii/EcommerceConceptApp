//
//  DetailViewModel.swift
//  EcommerceConceptApp
//
//  Created by Владимир Данилович on 26.12.22.
//

import SwiftUI
import Combine

final class DetailViewModel: ObservableObject {
    
    init(coordinator: DetailCoordinator) {
        self.coordinator = coordinator
        getDetail()
        if let first = detail.color.first {
            selectedColorHex = first
        }
    }
    
    @Published var selectedTabIndex: Int = 0
    @Published var selectedColorHex: String = ""
    @Published var selectedCapacity: String  = ""
    
    @Published var detail = ProductDetail()
    @Published var hardware: [String: String] = [:]
    
    let tabs = ["Shop", "Details", "Features"]
    
    private let coordinator: DetailCoordinator
    
    private let api = ApiManager()
    
    private var cancellable = Set<AnyCancellable>()
    
}

extension DetailViewModel {
    private func getDetail() {
        api.getProductDetail().sink { [weak self] product in
            self?.detail = product
            if let firstColor = product.color.first {
                self?.selectedColorHex = firstColor
            }
            if let firstCapacity = product.capacity.first {
                self?.selectedCapacity = firstCapacity
            }
            self?.hardware = [
                "1cpu"    : product.cpu,
                "2camera" : product.camera,
                "3ram"    : product.ssd,
                "4sd"     : product.sd
            ]
        }
        .store(in: &cancellable)
    }
}
