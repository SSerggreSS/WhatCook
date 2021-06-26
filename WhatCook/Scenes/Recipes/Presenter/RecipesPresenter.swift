//
//  RecipePresenter.swift
//  WhatCook
//
//  Created by Сергей  Бей on 14.06.2021.
//

import Foundation

class RecipesPresenter {
    
    lazy var neworkManager = NetworkManager() //TODO: зарегистрировать сервис в контейнере 
    
    let collectionData: RecipeCollectionDataProtocol!
    let recipePresentorFactory: RecipeCellPresenterFactoryProtocol!
    private var cellPresenters: [RecipeCollectionCellPresenter] = []
    private var title = "Recipes"
    
    private var recipes: [Recipe]?
    
    var view: RecipeViewControllerInput?
    
    init(collectionData: RecipeCollectionDataProtocol,
         recipePresentorFactory: RecipeCellPresenterFactoryProtocol) {
        self.collectionData = collectionData
        self.recipePresentorFactory = recipePresentorFactory
    }
    
}

extension RecipesPresenter: RecipeViewControllerOutput {
    func viewIsReady() {
        updateTitle()
        getRecipes()
    }
    func didSelectCell(with indexPath: IndexPath) {
        guard cellPresenters.indices.contains(indexPath.row) else { return }
        let presenter = cellPresenters[indexPath.row]
        //TODO: open details recipe
    }
}

extension RecipesPresenter {
    
    func updateTitle() {
        view?.updateTitle(title)
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
                return recipePresentorFactory.createRecipeCellPresenter(recipe: recipe, imageUploadService: )
            }
        updateCellPresenters()
    }
    
    func updateCellPresenters() {
        collectionData.updateCellPresenters(cellPresenters)
        view?.reloadData()
    }
}