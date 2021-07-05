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
        if #available(iOS 13.0, *) {
            recipeTabImage = UIImage(systemName: "list.bullet.rectangle")
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
        let tabsPresenter = TabsPresenter()
        tabsViewController = TabsViewController()
        tabsViewController.viewControllers = navigationControllers
        tabsPresenter.view = tabsViewController

    }
    
}
