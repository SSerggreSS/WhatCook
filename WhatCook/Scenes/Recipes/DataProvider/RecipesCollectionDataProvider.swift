//
//  RecipesCollectionDataProvider.swift
//  WhatCook
//
//  Created by Сергей  Бей on 13.06.2021.
//

import Foundation

protocol RecipeCollectionDataProtocol {
    func updateCellPresenters(_ presenters: [RecipeCollectionCellPresenter])
}

class RecipeCollectionDataProvider {
    private var presenters: [RecipeCollectionCellPresenter] = []
}

extension RecipeCollectionDataProvider: RecipeCollectionDataProtocol {
    func updateCellPresenters(_ presenters: [RecipeCollectionCellPresenter]) {
        self.presenters = presenters
    }
}
