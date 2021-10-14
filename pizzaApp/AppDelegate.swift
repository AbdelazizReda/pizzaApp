//
//  AppDelegate.swift
//  pizzaApp
//
//  Created by عبدالعزيز رضا  on 3/25/21.
//  Copyright © 2021 abdelazizReda. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window:UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.rootViewController = CustomTabBarController()
        window?.makeKeyAndVisible()
        
        return true
    }



}

