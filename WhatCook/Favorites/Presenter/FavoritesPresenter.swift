//
//  FavoritesPresenter.swift
//  WhatCook
//
//  Created by Сергей  Бей on 31.05.2021.
//

import Foundation

class FavoritesPresenter {
    
    var router: FavoritesViewControllerRouterInput?
    var recipes = [Recipe(id: 0, name: "Asorted Vigitables", description: "Go Cook")]
    
}

extension FavoritesPresenter: FavoritesViewControllerOutput {
    func selectedCellBy(indexPath: IndexPath) {
        //router push details view controller
        let recipe = recipes[indexPath.row]
        router?.moveToDetails(recipe: recipe)
    }
}
