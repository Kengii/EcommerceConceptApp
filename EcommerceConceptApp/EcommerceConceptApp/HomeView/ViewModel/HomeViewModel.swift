//
//  HomeViewModel.swift
//  EcommerceConceptApp
//
//  Created by Владимир Данилович on 25.12.22.
//

import Foundation
import Combine

enum PageType: String, CaseIterable {
    case home = ""
    case cart = "cart"
    case favorites = "favorites"
    case profile = "profile"
}

final class HomeViewModel: ObservableObject {

    init(coordinator: HomeCoordinator) {

        self.coordinator = coordinator
        getHomeData()
        storage.$count
            .assign(to: \.cartItemsCount, on: self)
            .store(in: &cancelleble)
    }

    @Published var selectedCategory: String = "Phones"
    @Published var searchText: String = ""
    @Published var cartItemsCount = 0

    @Published var hotSales = [Product]()
    @Published var bestSale = [BestSeler]()

    private let coordinator: HomeCoordinator
    private let storage = MocStorage.shared
    private let api = ApiManager()

    var cancelleble = Set<AnyCancellable>()

    let categories: [String] = [
        "Phones",
        "Computers",
        "Health",
        "Books",
        "Other"
    ]

    func didTapPage(_ page: PageType) {
        switch page {

        case .home:
            coordinator.toHome()
        case .cart:
            coordinator.toCart()
        case .favorites:
            coordinator.toFavorites()
        case .profile:
            coordinator.toProfile()
        }
    }

    func didTapDetail() {
        coordinator.toDetail()
    }
}

extension HomeViewModel {
    private func getHomeData() {
        api.getHomeStore().sink { [weak self] homeData in
            self?.hotSales = homeData.homeStore
            self?.bestSale = homeData.bestSeller
        }
            .store(in: &cancelleble)
    }
}


