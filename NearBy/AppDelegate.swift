//
//  AppDelegate.swift
//  NearBy
//
//  Created by Khaled Elshamy on 7/19/20.
//  Copyright © 2020 Khaled Elshamy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window?.makeKeyAndVisible()
        window?.rootViewController = PlacesVC()
        return true
    }

}

