//
//  Coordinator.swift
//  EcommerceConceptApp
//
//  Created by Владимир Данилович on 25.12.22.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    
    func start()
}
