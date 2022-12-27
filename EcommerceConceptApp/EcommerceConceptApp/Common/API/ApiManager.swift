//
//  ApiManager.swift
//  EcommerceConceptApp
//
//  Created by Владимир Данилович on 25.12.22.
//

import Foundation
import Combine

protocol API {
    func getHomeStore() -> AnyPublisher<HomeData, Never>
    func getProductDetail() -> AnyPublisher<ProductDetail, Never>
    func getBasketInfo() -> AnyPublisher<Basket, Never>
}

final class ApiManager: API {
    init() {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        self.decoder = decoder
    }

    let decoder: JSONDecoder

    func getHomeStore() -> AnyPublisher<HomeData, Never> {
        let link = "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175"
        guard let url = URL(string: link) else {
            return Just(HomeData(homeStore: [],
                bestSeller: [])).eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: HomeData.self, decoder: decoder)
            .catch { error in Just(HomeData(homeStore: [],
            bestSeller: [])) }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }

    func getProductDetail() -> AnyPublisher<ProductDetail, Never> {
        let link = "https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5"
        guard let url = URL(string: link) else {
            return Just(ProductDetail()).eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: ProductDetail.self, decoder: decoder)
            .catch { error in Just(ProductDetail()) }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }

    func getBasketInfo() -> AnyPublisher<Basket, Never> {
        let link = "https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149"
        guard let url = URL(string: link) else {
            return Just(Basket(basket: [], delivery: "", id: "", total: 0)).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Basket.self, decoder: decoder)
            .replaceError(with: Basket(basket: [], delivery: "", id: "", total: 0))
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
