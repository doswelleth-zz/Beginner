//
//  AppDelegate.swift
//  Beginner
//
//  Created by David Oliver Doswell on 12/31/17.
//  Copyright © 2017 David Oliver Doswell. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    let appColor = UIColor(red:0.95, green:0.79, blue:0.30, alpha:1.0)
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let homeTableViewController = HomeTableViewController()
        let navigationController = UINavigationController(rootViewController: homeTableViewController)
        self.window?.tintColor = appColor
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}

extension UINavigationController {
    override open var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
}

