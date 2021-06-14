//
//  ControllersFactory.swift
//  WhatCook
//
//  Created by Сергей  Бей on 07.06.2021.
//

import Foundation
import Swinject

class ControllerFactory {
    
    var container: Container!
    
    init(mainContainer: Container) {
        container = mainContainer
    }
    
}

protocol RecipesDetailsViewControllerFactory {
    func recipeDetails() -> RecipeDetailsConfigurator
}

extension ControllerFactory: RecipesDetailsViewControllerFactory {
    func recipeDetails() -> RecipeDetailsConfigurator {
        return container.resolve(RecipeDetailsConfigurator.self)!
    }
}
