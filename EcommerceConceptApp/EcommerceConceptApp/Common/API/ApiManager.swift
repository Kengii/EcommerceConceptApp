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
            return Just(HomeData(homeStore: [])).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: HomeData.self, decoder: decoder)
            .catch { error in Just(HomeData(homeStore: [])) }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
