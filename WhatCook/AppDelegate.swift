//
//  AppDelegate.swift
//  WhatCook
//
//  Created by Сергей  Бей on 16.05.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

   private let appService: AppSeviceProtocol = AppService()
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let configurator = appService.start()
        window?.rootViewController = configurator.configure()
        window?.makeKeyAndVisible()
        return true
    }


}

