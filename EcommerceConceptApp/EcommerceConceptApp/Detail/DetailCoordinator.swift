//
//  DetailCoordinator.swift
//  EcommerceConceptApp
//
//  Created by Владимир Данилович on 26.12.22.
//

import SwiftUI

final class DetailCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []

    var rootViewController = UIViewController()

    func start() {
        let vm = DetailViewModel(coordinator: self)
        let detailViewController = UIHostingController(rootView: DetailView(viewModel: vm))

        rootViewController = detailViewController
    }

    func toCart() {
        let vm = CartViewModel()
        let cartViewController = UIHostingController(rootView: CartView(viewModel: vm))

        rootViewController.navigationController?.pushViewController(cartViewController, animated: true)
    }
}
