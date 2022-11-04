//
//  AppDelegate.swift
//  UniversitiesApp
//
//  Created by Damir Aliyev on 03.11.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    var window: UIWindow?
    let navVC = UINavigationController()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = navVC
//        window?.rootViewController = MyUniversitiesViewController()
        
        let myUniversititesVC = MyUniversitiesViewController()
        let universitiesVC = ViewController()
        
        navVC.viewControllers = [myUniversititesVC]
        return true
    }

   

}

