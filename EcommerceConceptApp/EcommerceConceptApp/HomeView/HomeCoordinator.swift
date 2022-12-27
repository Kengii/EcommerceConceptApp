//
//  HomeCoordinator.swift
//  EcommerceConceptApp
//
//  Created by Владимир Данилович on 25.12.22.
//

import SwiftUI

final class HomeCoordinator: Coordinator {
    var rootViewController: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    init() {
        rootViewController = UINavigationController()
        rootViewController.navigationBar.isHidden = true
    }
    
    func start() {
        let vm = HomeViewModel(coordinator: self)
        let homeViewController = UIHostingController(rootView: HomeView(viewModel: vm))
        self.rootViewController.viewControllers = [homeViewController]
    }
    
    func toDetail() {
        let detailCoordinator = DetailCoordinator()
        detailCoordinator.start()
        childCoordinators.append(detailCoordinator)
        let vc = detailCoordinator.rootViewController
        
        self.rootViewController.pushViewController(vc, animated: true)
    }
    
    func toHome() {
        rootViewController.popToRootViewController(animated: true)
    }
    
    func toCart() {
        let vm = CartViewModel()
        let cartViewController = UIHostingController(rootView: CartView())
        
        rootViewController.pushViewController(cartViewController, animated: true)
        
    }
    
    func toFavorites() {
        
    }
    
    func toProfile() {
        
    }
}
