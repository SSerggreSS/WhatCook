//
//  ViewControllersFactory.swift
//  WhatCook
//
//  Created by Сергей  Бей on 01.06.2021.
//

import Foundation
import Swinject

class ViewControllerFactory {
    var container: Container!
    
    init(container: Container) {
        self.container = container
    }
}

//MARK: - RecipeDetailsViewControllerFactory

protocol RecipeDetailsViewControllerFactory {
    func recipeDetailsViewController() -> RecipesDetailsViewController
}

extension ViewControllerFactory: RecipeDetailsViewControllerFactory {
    func recipeDetailsViewController() -> RecipesDetailsViewController {
        return container.resolve(RecipesDetailsViewController.self)!
    }
}





