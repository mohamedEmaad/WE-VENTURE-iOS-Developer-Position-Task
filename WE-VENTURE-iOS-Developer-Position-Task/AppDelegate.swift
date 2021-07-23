//
//  AppDelegate.swift
//  TDDExample
//
//  Created by Mohamed Emad on 7/4/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = RootViewController.initialized()
        window?.makeKeyAndVisible()
        return true
    }


}

