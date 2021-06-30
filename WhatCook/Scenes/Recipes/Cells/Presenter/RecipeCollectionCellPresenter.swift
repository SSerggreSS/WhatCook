//
//  RecipeCollectionCellPresenter.swift
//  WhatCook
//
//  Created by Сергей  Бей on 12.06.2021.
//

import Foundation
import UIKit

class RecipeCollectionCellPresenter {
    
    let reusableType: Reusable.Type = RecipesViewCell.self
    ///Model recipe
    private(set) var recipe: Recipe
    ///Service for upload image by url
    private(set) var imageUploadService: ImageUploadServiceProtocol
    /// Image for meal form recipe
    weak var view: RecipeCollectionCellInput?
    
    init(recipe: Recipe, imageUploadService: ImageUploadServiceProtocol) {
        self.recipe = recipe
        self.imageUploadService = imageUploadService
    }

}

//MARK: private extension RecipeCollectionCellPresenter

private extension RecipeCollectionCellPresenter {
    func updateTitle() {
        view?.updateTitle(text: recipe.name)
    }
}

//MARK: - RecipeCollectionViewCellOutput

extension RecipeCollectionCellPresenter: RecipeCollectionViewCellOutput {
    func viewIsReady() {
        updateTitle()
        if let imageData = recipe.imageData {
            self.view?.updateMealImageWith(data: imageData)
        } else {
            imageUploadService.getImageDataBy(urlString: recipe.imageUrl) { [weak self] result in
                switch result {
                case .failure(let error):
                    //TODO: process error
                    fatalError(error.rawValue)
                case .success(let data):
                    self?.view?.updateMealImageWith(data: data)
                    self?.recipe.imageData = data
                }
            }
        }
    }
}


