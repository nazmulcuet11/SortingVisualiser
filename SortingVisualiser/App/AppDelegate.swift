//
//  AppDelegate.swift
//  SortingVisualiser
//
//  Created by Nazmul's Mac Mini on 7/4/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let rootVC = VisualiserVC.instantiate()
        rootVC.dataProvider = BubbleSort()
//        rootVC.dataProvider = SelectionSort()
        let navController = UINavigationController(rootViewController: rootVC)

        let window = UIWindow()
        window.rootViewController = navController
        window.makeKeyAndVisible()
        self.window = window

        return true
    }
}

