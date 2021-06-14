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

class RecipeCollectionViewDataProvider: RecipesCollectionViewDataProviderProtocol {
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return recipePresenters.count
    }
    
    func cellForRow(at indexPath: IndexPath) -> RecipeCollectionCellPresenter {
        return RecipeCollectionCellPresenter()
    }
    
    private let recipePresenters: [RecipeCollectionCellPresenter] = []
}
