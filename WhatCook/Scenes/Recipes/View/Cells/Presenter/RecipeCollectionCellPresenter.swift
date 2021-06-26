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
    ///Factory for create service
    let imageUploadServiceFactory: ImageUploadServiceFactoryProtocol
    /// Image for meal form recipe
    private var mealImage: UIImage?
    
    
    weak var view: RecipeCollectionCellInput?
    
    init(recipe: Recipe, imageUploadServiceFactory: ImageUploadServiceFactoryProtocol) {
        self.recipe = recipe
        self.imageUploadServiceFactory = imageUploadServiceFactory
        imageUploadService = imageUploadServiceFactory.createImageUploadService()
        mealImage = imageUploadService.getImageBy(urlString: recipe.imageUrl)
    }

}

//MARK: - internal extension RecipeCollectionCellPresenter

extension RecipeCollectionCellPresenter {
    var image: UIImage? {
        var image: UIImage?
        DispatchQueue.global(qos: .background).async {
            guard let urlImage = URL(string: self.recipe.imageUrl) else { return }
            guard let data = try? Data(contentsOf: urlImage) else { return }
            DispatchQueue.main.async {
                image = UIImage(data: data)
            }
        }
    
        return image
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
        view?.updateMeal(image: image)
    }
}


