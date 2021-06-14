//
//  RecipesCollectionDataProviderFactory.swift
//  WhatCook
//
//  Created by Сергей  Бей on 13.06.2021.
//

import Foundation

protocol RecipesCollectionDataProviderFactoryProtocol {
    func createDataProvider() -> RecipeCollectionDataProvider
}

class RecipesCollectionDataProviderFactory: RecipesCollectionDataProviderFactoryProtocol {
    func createDataProvider() -> RecipeCollectionDataProvider {
        return RecipeCollectionDataProvider()
    }

}
