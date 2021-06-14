//
//  RecipeCollectionCellPresenter.swift
//  WhatCook
//
//  Created by Сергей  Бей on 12.06.2021.
//

import Foundation

class RecipeCollectionCellPresenter {
    
    let reusableType: Reusable.Type = RecipesViewCell.self
    
    private(set) var recipe: Recipe
    
    weak var view: RecipeCollectionCellInput?
    
    init(recipe: Recipe) {
        self.recipe = recipe
    }

}

extension RecipeCollectionCellPresenter: RecipeCollectionViewCellOutput {
    func viewIsReady() {
        updateTitle()
    }
}

private extension RecipeCollectionCellPresenter {
    func updateTitle() {
        view?.updateTitle(text: recipe.name)
    }
}
