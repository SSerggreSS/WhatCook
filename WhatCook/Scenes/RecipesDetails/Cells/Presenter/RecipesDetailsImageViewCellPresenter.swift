//
//  RecipesDetailsImageViewCellPresenter.swift
//  WhatCook
//
//  Created by Сергей  Бей on 30.06.2021.
//

import Foundation

protocol RecipesDetailsImageViewCellPresenterInput: BasePresenterInput { }

class RecipesDetailsImageViewCellPresenter {
    
    private let recipe: Recipe!
    weak private var view: RecipesDetailsImageViewCellInput!
    
    init(recipe: Recipe, view: RecipesDetailsImageViewCellInput) {
        self.recipe = recipe
        self.view = view
    }
    
}

extension RecipesDetailsImageViewCellPresenter: RecipesDetailsImageViewCellPresenterInput {
    
    func viewDidLoad() {
        view?.updateInterfaceWith(recipe)
    }
    
}
