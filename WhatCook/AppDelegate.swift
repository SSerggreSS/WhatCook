//
//  AppDelegate.swift
//  WhatCook
//
//  Created by Сергей  Бей on 16.05.2021.
//

import UIKit
import RealmSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

   private let appService: AppSeviceProtocol = AppService()
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let configurator = appService.start()
        window?.rootViewController = configurator.configure()
        window?.makeKeyAndVisible()
        
//       let rs =  RealmService()
//
//        let ro = RRecipe()
//        ro.name = "yyyyyyyyy"
//        ro.id = 123
//        rs.writeObject([ro]) {
//            print("succes!!")
//        }
//        var resObj = [RRecipe]()
//        rs.readObjects { o in
//            o?.forEach { ob in
//                print(ob.name)
//            }
//        } //let realm =
        
        return true
    }


}

