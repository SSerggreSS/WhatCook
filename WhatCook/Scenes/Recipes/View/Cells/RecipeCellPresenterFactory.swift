//
//  RecipeCellPresenterFactory.swift
//  WhatCook
//
//  Created by Сергей  Бей on 14.06.2021.
//

import Foundation

protocol RecipeCellPresenterFactoryProtocol {
    func createRecipeCellPresenter(recipe: Recipe) -> RecipeCollectionCellPresenter
}

class RecipeCellPresenterFactory: RecipeCellPresenterFactoryProtocol {
    func createRecipeCellPresenter(recipe: Recipe) -> RecipeCollectionCellPresenter {
        return RecipeCollectionCellPresenter(recipe: recipe)
    }
}
