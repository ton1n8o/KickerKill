//
//  AppDelegate.swift
//  KickerKill
//
//  Created by Antonio on 8/31/19.
//  Copyright © 2019 Antonio Carlos. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let initialViewController = BaseNavigationController()
        initialViewController.setRootWireframe(SoundEffectsWireFrame())
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = initialViewController
        self.window?.makeKeyAndVisible()
        
        return true
    }
}
