//
//  RecipeDetailsPresenter.swift
//  WhatCook
//
//  Created by Сергей  Бей on 30.06.2021.
//

import Foundation

protocol RecipeDetailsPresenterInput: BasePresenterInput {
    var recipe: Recipe! { get set }
}

class RecipeDetailsPresenter: BasePresenter {
    
    internal var recipe: Recipe!
    weak var view: RecipesDetailsViewControllerInput?
    
    init(recipe: Recipe) {
        self.recipe = recipe
        
    }
    
}

//MARK: - RecipeDetailsPresenterInput

extension RecipeDetailsPresenter: RecipeDetailsPresenterInput {
    
    func viewDidLoad() {
        view?.updateTitle(text: local("RECIPE_DETAILS", "RecipeDetails"))
    }
}
