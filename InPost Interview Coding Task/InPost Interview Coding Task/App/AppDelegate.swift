//
//  AppDelegate.swift
//  InPost Interview Coding Task
//
//  Created by Damian Piwowarski on 03/11/2022.
//

import Swinject
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    private(set) var assembler: Assembler!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        initDI()

        buildStartingView()
        return true
    }

    private func buildStartingView() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: assembler.resolver.resolve(PacksViewController.self)!)
        window?.makeKeyAndVisible()
    }
}

private extension AppDelegate {
    /// Initializing dependency injection
    func initDI() {
        assembler = Assembler([
            /// Screens
            PacksAssembly(),

            /// Services
            PacksServiceAssembly(),

        ])
    }
}
