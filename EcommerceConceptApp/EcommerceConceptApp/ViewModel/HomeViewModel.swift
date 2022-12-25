//
//  HomeViewModel.swift
//  EcommerceConceptApp
//
//  Created by Владимир Данилович on 25.12.22.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    
    init(coordinator: HomeCoordinator) {
        
        self.coordinator = coordinator
        getHomeData()
    }
    @Published var hotSales = [Product]()
    private let coordinator: HomeCoordinator
    private let api = ApiManager()
    
    var cancelleble = Set<AnyCancellable>()
}

extension HomeViewModel {
    private func getHomeData() {
        api.getHomeStore().sink { [weak self] homeData in
            self?.hotSales = homeData.homeStore
        }
        .store(in: &cancelleble)
    }
}
    

