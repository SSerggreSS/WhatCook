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
        
        let networkManager = NetworkManager()

        networkManager.getNewRecipes { recipes, error in
            if let error = error {
                print(error)
            } else {
                print(recipes!)
            }
        }
       
        /*
        let headers = [
            "x-rapidapi-key": "",
            "x-rapidapi-host": "tasty.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://tasty.p.rapidapi.com/recipes/list?from=0&size=20&tags=under_30_minutes")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
             
                print(data)
                do {
                let o = try? JSONDecoder().decode(RecipeApiResponse.self, from: data!)
                
                print(o)
                } catch {
                    fatalError()
                }
            }
        })

        dataTask.resume()
 */
        return true
    }


}

