//
//  RecipePresenter.swift
//  WhatCook
//
//  Created by Сергей  Бей on 14.06.2021.
//

import Foundation
import UIKit

class RecipesPresenter: BasePresenter {
    
    var imageUploadServiceFactory: ImageUploadServiceFactoryProtocol!
    let recipePresentorFactory: RecipeCellPresenterFactoryProtocol!
    let recipeDetailsControllerFactory: RecipeDetailsViewControllerFactoryProtocol!
    let collectionData: RecipeCollectionDataProtocol!
    
    let neworkManager: NetworkManagerProtocol!
    private var cellPresenters: [RecipeCollectionCellPresenter] = []
    private var title = "Recipes"
    
    private var recipes: [Recipe]?
    
    var view: RecipeViewControllerInput?
    
    init(collectionData: RecipeCollectionDataProtocol,
         recipePresentorFactory: RecipeCellPresenterFactoryProtocol,
         imageUploadServiceFactory: ImageUploadServiceFactoryProtocol,
         neworkManager: NetworkManagerProtocol,
         recipeDetailsControllerFactory: RecipeDetailsViewControllerFactoryProtocol) {
        self.collectionData = collectionData
        self.recipePresentorFactory = recipePresentorFactory
        self.imageUploadServiceFactory = imageUploadServiceFactory
        self.neworkManager = neworkManager
        self.recipeDetailsControllerFactory = recipeDetailsControllerFactory
        super.init()
        getRecipes()
    }
    
}

extension RecipesPresenter: RecipeViewControllerOutput {
    func viewIsReady() {
        updateTitle()
    }
    func didSelectCell(with indexPath: IndexPath) {
        guard cellPresenters.indices.contains(indexPath.row) else { return }
        let presenter = cellPresenters[indexPath.row]
        moveToDetailsFor(recipe: presenter.recipe)
        //TODO: open details recipe
    }
}

private extension RecipesPresenter {
    
    func updateTitle() {
        view?.updateTitle(local("RECIPES", "RecipeDetails"))
    }
    
    func getRecipes() {
        neworkManager.getNewRecipes { [weak self] recipes, error in
            if let error = error {
                //TODO: error not data
                fatalError(error)
            } else {
                guard let recipes = recipes else {
                    //TODO: error not data
                    fatalError()
                }
                self?.mapToCellPresenters(recipes: recipes)
            }
        }
    }
    
    /// Transfers received recipes to cell presenters
    func mapToCellPresenters(recipes: [Recipe]) {
            cellPresenters = recipes.map { recipe -> RecipeCollectionCellPresenter in
                return recipePresentorFactory.createRecipeCellPresenter(recipe: recipe, imageUploadService: imageUploadServiceFactory.createImageUploadService())
            }
        updateCellPresenters()
    }
    
    func updateCellPresenters() {
        collectionData.updateCellPresenters(cellPresenters)
        view?.reloadData()
    }
    
    func moveToDetailsFor(recipe: Recipe) {
        //TODO:
        let recipeDetailsPresenter = RecipeDetailsPresenter(recipe: recipe)
        let recipeDetailsController = recipeDetailsControllerFactory.recipeDetailsViewController(
            presenter: recipeDetailsPresenter
        )
        recipeDetailsPresenter.view = recipeDetailsController
        let _ = UINavigationController(
            rootViewController: recipeDetailsController
        )

        router?.navigationController?.pushViewController(
            recipeDetailsController,
            animated: true
        )
    }
    
}
