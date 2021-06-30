//
//  RecipeDetailsDescriptionViewCellPresenter.swift
//  WhatCook
//
//  Created by Сергей  Бей on 30.06.2021.
//

import Foundation

protocol RecipeDetailsDescriptionViewCellPresenterInput: BasePresenterInput {
    
    var recipe: Recipe! { get set }
    
}

class RecipeDetailsDescriptionViewCellPresenter {
    
    
    weak var view: DescriptionRecipesTableCellViewInput?
    var recipe: Recipe!
    
    init(recipe: Recipe, view: DescriptionRecipesTableCellViewInput) {
        self.recipe = recipe
        self.view = view
    }
    
}

extension RecipeDetailsDescriptionViewCellPresenter: RecipeDetailsDescriptionViewCellPresenterInput {

    func viewDidLoad() {
        view?.updateInterfaceWith(recipe)
    }

}
