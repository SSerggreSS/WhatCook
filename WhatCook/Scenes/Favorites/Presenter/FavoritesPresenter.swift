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
    var view: FavoritesViewControllerInput?
    var router: FavoritesViewControllerRouterInput?
    var recipes = [Recipe(name: "Asorted Vigitables")]
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
        let recipe = recipes[indexPath.row]
        router?.moveToDetails(recipe: recipe)
    }
}
