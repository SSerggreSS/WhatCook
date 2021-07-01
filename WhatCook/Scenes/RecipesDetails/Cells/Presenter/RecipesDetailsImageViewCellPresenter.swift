//
//  RecipesDetailsImageViewCellPresenter.swift
//  WhatCook
//
//  Created by Сергей  Бей on 30.06.2021.
//

import Foundation

protocol RecipesDetailsImageViewCellPresenterInput: BasePresenterInput {
    ///Добавить или удалить рецепт из базы данных
    func addOrDeleteRecipeInFavorites()
}

class RecipesDetailsImageViewCellPresenter {
    
    let realmService: DataBaseServiceProtocol = RealmService()
    
    private let recipe: Recipe!
    weak private var view: RecipesDetailsImageViewCellInput!
    
    init(recipe: Recipe, view: RecipesDetailsImageViewCellInput) {
        self.recipe = recipe
        self.view = view
    }
    
}

extension RecipesDetailsImageViewCellPresenter: RecipesDetailsImageViewCellPresenterInput {
    
    func addOrDeleteRecipeInFavorites() {
        guard let realmRecipe = RecipeMapper.mapTo(item: recipe) else { return }
        if let existObject = realmService.realm.object(
            ofType: RRecipe.self,
            forPrimaryKey: realmRecipe.id
        ) {
            realmService.deleteObject([existObject]) { [weak self] in
                self?.view?.setFavoriteButtonImageWith(name: "star")
                print("💥💥💥 !!!Recipe will be deleted in favorites!!! 💥💥💥")
            }
        } else {
            realmService.writeObject([realmRecipe], succesCompletion: { [weak self] in
                //TODO: показать тостер что рецепт добавлен в избранное
                self?.view?.setFavoriteButtonImageWith(name: "star.fill")
                print("★★★ !!!Recipe will be added in favorites!!! ★★★")
        })
    }
 }
    
    func viewDidLoad() {
        view?.updateInterfaceWith(recipe)
    }
    
}
