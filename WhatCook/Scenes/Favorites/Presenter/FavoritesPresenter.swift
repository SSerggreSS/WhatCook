//
//  FavoritesPresenter.swift
//  WhatCook
//
//  Created by Сергей  Бей on 31.05.2021.
//

import Foundation

//этот протокол реализует презентер чтобы получать от вью сообщения
protocol FavoritesPresenterInput {
    func viewIsRedy()
}

class FavoritesPresenter {
    
    weak var view: FavoritesViewControllerInput?
    var router: FavoritesViewControllerRouterInput?
    var recipes: [RRecipe]?
    
    let realmService = RealmService()
    
    init() {
        realmService.readObjects { recipes in
            self.recipes = recipes
            print(recipes?.count)
        }
    }
    
}

//MARK: - FavoritesPresenterInput

extension FavoritesPresenter: FavoritesPresenterInput {
    func viewIsRedy() {
        print("View ask - get data!!!")
    }
}

extension FavoritesPresenter: FavoritesViewControllerOutput {
    func selectedCellBy(indexPath: IndexPath) {
        //router push details view controller
        let recipe = recipes?[indexPath.row]
        router?.moveToDetails(rrecipe: recipe)
    }
}
