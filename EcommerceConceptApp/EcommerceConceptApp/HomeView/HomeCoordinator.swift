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
        
    }
    
    func toHome() {
        rootViewController.popToRootViewController(animated: true)
    }
    
    func toCart() {
        
    }
    
    func toFavorites() {
        
    }
    
    func toProfile() {
        
    }
}
