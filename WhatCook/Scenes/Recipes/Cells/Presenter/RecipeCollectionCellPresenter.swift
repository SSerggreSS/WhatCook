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
    private(set) var recipe: Recipe!
    private(set) var realmRecipe: RRecipe!
    private var isFavorite = false
    ///Service for upload image by url
    private(set) var imageUploadService: ImageUploadServiceProtocol
    /// Image for meal form recipe
    weak var view: RecipeCollectionCellInput?
    
    lazy private var realmService: DataBaseServiceProtocol! = RealmService()
    
    init(recipe: Recipe, imageUploadService: ImageUploadServiceProtocol) {
        self.recipe = recipe
        self.imageUploadService = imageUploadService
        realmRecipe = RecipeMapper.mapTo(item: recipe)
        //self.recipeIsFavorite()
    }

}

//MARK: private extension RecipeCollectionCellPresenter

private extension RecipeCollectionCellPresenter {
    func updateTitle() {
        view?.updateTitle(text: recipe.name)
    }
    
    func recipeIsFavorite() {
        let recipes = realmService.realm.objects(RRecipe.self).filter("id == %@", realmRecipe.id)
        if recipes.isEmpty {
            isFavorite = false
        } else {
            isFavorite = true
        }
    }
    
    func nameForPictureOfFavorites() -> String {
        if isFavorite {
            return "star.fill"
        } else {
            return "star"
        }
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
        
        let nameFavoriteImage = nameForPictureOfFavorites()
        view?.setFavoriteButtonImageWith(name: nameFavoriteImage)
        
    }
    
    func addOrDeleteRecipeInFavorites() {
        
       
        let recipes = realmService.realm.objects(RRecipe.self).filter("id == %@", realmRecipe.id)
        
        if !recipes.isEmpty {
            
            realmService.deleteObject([realmRecipe]) { [weak self] in
                self?.view?.setFavoriteButtonImageWith(name: "star")
                print("💥💥💥 !!!Recipe will be deleted in favorites!!! 💥💥💥")
            }
            realmRecipe = RecipeMapper.mapTo(item: recipe)
        } else {
            
            realmService.writeObject([realmRecipe], succesCompletion: { [weak self] in
                //TODO: показать тостер что рецепт добавлен в избранное
                self?.view?.setFavoriteButtonImageWith(name: "star.fill")
                print("★★★ !!!Recipe will be added in favorites!!! ★★★")
            })
        }
        

        //TODO: обработать отсутствие рецепта

    }
    
}


