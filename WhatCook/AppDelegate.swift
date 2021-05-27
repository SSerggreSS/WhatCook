//
//  AppDelegate.swift
//  WhatCook
//
//  Created by Сергей  Бей on 16.05.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let enteringProdViewController = EnteringProductsViewController()
        let tableViewController = RecipesDetailsViewController()
        window?.rootViewController = tableViewController
        window?.makeKeyAndVisible()
        return true
    }


}

