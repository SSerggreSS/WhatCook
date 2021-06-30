//
//  ViewControllersFactory.swift
//  WhatCook
//
//  Created by Сергей  Бей on 01.06.2021.
//

import Foundation
import Swinject


//MARK: - RecipeDetailsViewControllerFactory

protocol RecipeDetailsViewControllerFactoryProtocol {
    func recipeDetailsViewController(presenter: RecipeDetailsPresenterInput) -> RecipesDetailsViewController
}

class RecipeDetailsViewControllerFactory: BaseFactory { }

extension RecipeDetailsViewControllerFactory: RecipeDetailsViewControllerFactoryProtocol {
    func recipeDetailsViewController(presenter: RecipeDetailsPresenterInput) -> RecipesDetailsViewController {
        let recipeDetailsViewController = RecipesDetailsViewController()
        recipeDetailsViewController.presenter = presenter
        return recipeDetailsViewController
    }
}





