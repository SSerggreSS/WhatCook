//
//  RecipesCollectionDataProviderProtocol.swift
//  WhatCook
//
//  Created by Сергей  Бей on 11.06.2021.
//

import Foundation

protocol RecipesCollectionViewDataProviderProtocol {
    var numberOfSections: Int { get }
    func numberOfRows(in section: Int) -> Int
    func cellForRow(at indexPath: IndexPath) -> RecipeCollectionCellPresenter
}

class RecipeCollectionDataProvider {
    private var presenters: [RecipeCollectionCellPresenter] = []
}

extension RecipeCollectionDataProvider: RecipesCollectionViewDataProviderProtocol {
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return presenters.count
    }
    
    func cellForRow(at indexPath: IndexPath) -> RecipeCollectionCellPresenter {
        return presenters[indexPath.row]
    }
    
}

protocol RecipeCollectionDataProtocol {
    func updateCellPresenters(_ presenters: [RecipeCollectionCellPresenter])
}

extension RecipeCollectionDataProvider: RecipeCollectionDataProtocol {
    func updateCellPresenters(_ presenters: [RecipeCollectionCellPresenter]) {
        self.presenters = presenters
    }
}
