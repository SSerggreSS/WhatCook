//
//  ViewControllerFactory.swift
//  WhatCook
//
//  Created by Сергей  Бей on 01.06.2021.
//

import Foundation

class ViewControllerFactory { }

protocol RecipeDetailsViewControllerFactory {
    func recipeDetailsViewController() -> RecipesDetailsViewController
}

extension ViewControllerFactory: RecipeDetailsViewControllerFactory {
    func recipeDetailsViewController() -> RecipesDetailsViewController {
        let recipeDetailsViewController = RecipesDetailsViewController()
        return recipeDetailsViewController
    }
}


