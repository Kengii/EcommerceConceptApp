//
//  CartViewModel.swift
//  EcommerceConceptApp
//
//  Created by Владимир Данилович on 27.12.22.
//

import SwiftUI
import Combine

final class CartViewModel: ObservableObject {

    init() {
        self.getBasket()
    }


    @Published var basket: Basket = Basket(basket: [], delivery: "", id: "", total: 0)
    @Published var cartItems: [BasketItem] = []
    @Published var total = 0

    private let api: API = ApiManager()

    private var cancellable = Set<AnyCancellable>()
}

extension CartViewModel {
    private func getBasket() {
        api.getBasketInfo().sink { [weak self] basket in
            self?.total = basket.total
            self?.basket = basket
            self?.cartItems = basket.basket
        }
            .store(in: &cancellable)
    }
}
