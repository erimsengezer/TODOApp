//
//  AppCoordinator.swift
//  GetirTodo
//
//  Created by Erim Şengezer on 3.02.2022.
//

import UIKit

protocol AppCoordinatorFlow: AnyObject {
    func startFlowMain()
}

class AppCoordinator: RootableCoordinator, AppCoordinatorFlow {
    
    override func start() {
        let splashCoordinator = SplashCoordinator(window: self.window)
        coordinate(to: splashCoordinator)
    }
    
    func startFlowMain() {
        let listCoordinator = ListCoordinator(window: self.window)
        coordinate(to: listCoordinator)
    }
}
