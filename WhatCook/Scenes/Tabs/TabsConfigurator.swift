//
//  TabsConfigurator.swift
//  WhatCook
//
//  Created by Сергей  Бей on 03.07.2021.
//

import Foundation
import Swinject

class TabsConfigurator {
    
    var tabsViewController: TabsViewController!
    
    init(resolver: Resolver) {
        
        var navigationControllers = [UINavigationController]()
        
        let resipeListItem = UITabBarItem(title: "recipes", image: nil, selectedImage: nil)
        guard let recipeController = resolver.resolve(RecipesViewController.self) else { return }
        let recipeNavigationController = UINavigationController(rootViewController: recipeController)
        recipeNavigationController.tabBarItem = resipeListItem
        navigationControllers.append(recipeNavigationController)
        
        let tabsPresenter = TabsPresenter()
        tabsViewController = TabsViewController(tabControllers: navigationControllers, presenter: tabsPresenter)
        tabsPresenter.view = tabsViewController

    }
    
}
