//
//  AppDelegate.swift
//  GetirTodo
//
//  Created by Umut Afacan on 21.12.2020.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Start Coordinator
        self.startAppCoordinator()
        return true
    }
    
    private func startAppCoordinator() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.appCoordinator = AppCoordinator(window: window)
        self.window = window

        self.startFlowSplash()
    }

    func startFlowSplash() {
        self.appCoordinator.start()
    }
    
    func startFlowMain() {
        self.appCoordinator.startFlowMain()
    }
}

