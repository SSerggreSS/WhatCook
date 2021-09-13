//
//  FavoritesViewControllerRouter.swift
//  WhatCook
//
//  Created by Сергей  Бей on 01.06.2021.
//

import Foundation
import UIKit

protocol FavoritesViewControllerRouterInput: class  {
    func moveToDetails(rrecipe: RRecipe?)
}

class FavoritesViewControllerRouter {
    
    var recipeDetailsFactory: RecipeDetailsViewControllerFactoryProtocol!
    
    init(recipeDetailsFactory: RecipeDetailsViewControllerFactoryProtocol) {
        self.recipeDetailsFactory = recipeDetailsFactory
    }
    
    var routerController = UIViewController()
    var factory: RecipeDetailsViewControllerFactoryProtocol?
}

extension FavoritesViewControllerRouter: FavoritesViewControllerRouterInput {
    
    func moveToDetails(rrecipe: RRecipe?) {
        guard let rrecipe = rrecipe else { return }
        let recipe = RecipeMapper.mapFrom(item: rrecipe)!
        let recipeDetailsPresenter = RecipeDetailsPresenter(recipe: recipe)
        guard let recipeDetailsViewController = factory?.recipeDetailsViewController(presenter: recipeDetailsPresenter) else { return }
        routerController.navigationController?.pushViewController(recipeDetailsViewController,
                                                                  animated: true)
    }
    
    
}
