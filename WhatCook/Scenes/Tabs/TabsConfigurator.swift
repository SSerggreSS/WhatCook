//
//  TabsConfigurator.swift
//  WhatCook
//
//  Created by Сергей  Бей on 03.07.2021.
//

import Foundation
import Swinject



class TabsConfigurator: Configurator {
    
    func configure() -> UIViewController {
        print("tabsViewController = \(tabsViewController)")
        return tabsViewController
    }
    
    
    var tabsViewController: TabsViewController!
    
    init(container: Container) {
        
        var navigationControllers = [UINavigationController]()
        
        var recipeTabImage: UIImage?
        var favoriteTabImage: UIImage?
        if #available(iOS 13.0, *) {
            recipeTabImage = UIImage(systemName: "list.bullet.rectangle")
            favoriteTabImage = UIImage(systemName: "line.horizontal.star.fill.line.horizontal")
        }
        let resipeListItem = UITabBarItem(
            title: "recipes",
            image: recipeTabImage,
            selectedImage: nil
        )
        
        guard let recipeConfigurator = container.resolve(RecipesConfigurator.self) else { return }
        let recipeNavigationController = recipeConfigurator.configure() as! UINavigationController
        recipeNavigationController.tabBarItem = resipeListItem
        navigationControllers.append(recipeNavigationController)
        
        let favoriteListItem = UITabBarItem(
            title: "favorites",
            image: favoriteTabImage,
            selectedImage: nil
        )
        //TODO: create favorite controller module
        let favoritesViewController = FavoritesViewController()
        let favoriteNavigationController = UINavigationController(rootViewController: favoritesViewController)
        favoriteNavigationController.tabBarItem = favoriteListItem
        navigationControllers.append(favoriteNavigationController)
        
        let tabsPresenter = TabsPresenter()
        tabsViewController = TabsViewController()
        tabsViewController.viewControllers = navigationControllers
        tabsPresenter.view = tabsViewController

    }
    
}
