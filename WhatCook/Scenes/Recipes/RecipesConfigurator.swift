//
//  RecipesConfigurator.swift
//  WhatCook
//
//  Created by Сергей  Бей on 11.06.2021.
//

import Foundation
import UIKit

protocol CollectionDataProviderFactoryProtocol {
    
}

class RecipesConfigurator: Configurator {
    
    private let recipesProvider: RecipeProviderProtocol
    private let collectionDataProviderFactory: RecipesCollectionDataProviderFactoryProtocol
    private let cellPresenterFactory: RecipeCellPresenterFactoryProtocol
    
    init(recipesProvider: RecipeProviderProtocol,
         collectionDataProviderFactory: RecipesCollectionDataProviderFactoryProtocol,
         cellPresenterFactory: RecipeCellPresenterFactoryProtocol
    ) {
        self.recipesProvider = recipesProvider
        self.collectionDataProviderFactory = collectionDataProviderFactory
        self.cellPresenterFactory = cellPresenterFactory
    }
    
    func configure() -> UIViewController {
        let dataProvider = collectionDataProviderFactory.createDataProvider()
        
        let presenter = RecipesPresenter(collectionData: dataProvider,
                                         recipePresentorFactory: cellPresenterFactory)
        let recipeViewController = RecipesViewController(presenter: presenter, dataProvider: dataProvider)
        presenter.view = recipeViewController
        let navigationController = UINavigationController(rootViewController: recipeViewController)
        return navigationController
    }
}
