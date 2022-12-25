//
//  AppCoordinator.swift
//  EcommerceConceptApp
//
//  Created by Владимир Данилович on 25.12.22.
//

import SwiftUI
import Combine

class AppCoordinator: Coordinator {
    var rootViewController: UIViewController = UINavigationController()
    
    var childCoordinators: [Coordinator] = []
    
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let homeCoordinator = HomeCoordinator()
        homeCoordinator.start()
        self.childCoordinators = [homeCoordinator]
        window.rootViewController = homeCoordinator.rootViewController
        window.makeKeyAndVisible()
    }
}
