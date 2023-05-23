//
//  AppDelegate.swift
//  InPost Interview Coding Task
//
//  Created by Damian Piwowarski on 03/11/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        buildStartingView()
        return true
    }

    private func buildStartingView() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = PacksViewController.instantiate()
        window?.makeKeyAndVisible()
    }
    
}
