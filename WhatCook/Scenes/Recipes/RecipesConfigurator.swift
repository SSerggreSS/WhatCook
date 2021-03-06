//
//  RecipesConfigurator.swift
//  WhatCook
//
//  Created by Сергей  Бей on 11.06.2021.
//

import Foundation
import UIKit

class RecipesConfigurator: Configurator {
    
    private let recipesProvider: RecipeProviderProtocol
    private let collectionDataProviderFactory: RecipesCollectionDataProviderFactoryProtocol
    private let cellPresenterFactory: RecipeCellPresenterFactoryProtocol
    private let imageUploadServiceFactory: ImageUploadServiceFactoryProtocol
    private let networkManager: NetworkManagerProtocol
    private let recipeDetailsControllerFactory: RecipeDetailsViewControllerFactoryProtocol
    
    init(recipesProvider: RecipeProviderProtocol,
         collectionDataProviderFactory: RecipesCollectionDataProviderFactoryProtocol,
         cellPresenterFactory: RecipeCellPresenterFactoryProtocol,
         imageUploadServiceFactory: ImageUploadServiceFactoryProtocol,
         networkManager: NetworkManagerProtocol,
         recipeDetailsControllerFactory: RecipeDetailsViewControllerFactoryProtocol
    ) {
        self.recipesProvider = recipesProvider
        self.collectionDataProviderFactory = collectionDataProviderFactory
        self.cellPresenterFactory = cellPresenterFactory
        self.imageUploadServiceFactory = imageUploadServiceFactory
        self.networkManager = networkManager
        self.recipeDetailsControllerFactory = recipeDetailsControllerFactory
    }
    
    func configure() -> UIViewController {
        let dataProvider = collectionDataProviderFactory.createDataProvider()
        
        let presenter = RecipesPresenter(
            collectionData: dataProvider,
            recipePresentorFactory: cellPresenterFactory,
            imageUploadServiceFactory: imageUploadServiceFactory,
            neworkManager: networkManager,
            recipeDetailsControllerFactory: recipeDetailsControllerFactory
        )
        let recipeViewController = RecipesViewController(presenter: presenter,
                                                         dataProvider: dataProvider)
        
        presenter.view = recipeViewController
        presenter.router = recipeViewController
        
        let navigationController = UINavigationController(rootViewController: recipeViewController)
        return navigationController
    }
}
