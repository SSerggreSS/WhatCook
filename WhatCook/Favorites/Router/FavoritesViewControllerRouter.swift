//
//  FavoritesViewControllerRouter.swift
//  WhatCook
//
//  Created by Сергей  Бей on 01.06.2021.
//

import Foundation
import UIKit

class FavoritesViewControllerRouter {
    var routerController = UIViewController()
    var factory: RecipeDetailsViewControllerFactory?
}

extension FavoritesViewControllerRouter: FavoritesViewControllerRouterInput {
    func moveToDetails(recipe: Recipe) {
        guard let recipeDetailsViewController = factory?.recipeDetailsViewController() else { return }
        routerController.navigationController?.pushViewController(recipeDetailsViewController,
                                                                  animated: true)
    }
    
    
}
