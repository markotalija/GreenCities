//
//  AppDelegate.swift
//  Green Cities
//
//  Created by Marko Rankovic on 11/26/18.
//  Copyright © 2018 Marko Rankovic. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    //MARK: - Properties
    var window: UIWindow?

    //MARK: - UIApplicationDelegate
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //Change navigation bar colors
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: GREEN_COLOR]
    
        return true
    }
}

