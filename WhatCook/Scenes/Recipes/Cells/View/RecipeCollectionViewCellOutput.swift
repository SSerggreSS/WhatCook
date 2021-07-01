//
//  RecipeCollectionViewCellOutput.swift
//  WhatCook
//
//  Created by Сергей  Бей on 12.06.2021.
//

import Foundation

protocol RecipeCollectionViewCellOutput: AnyObject {
    var view: RecipeCollectionCellInput? { get set }
    func viewIsReady()
    func addOrDeleteRecipeInFavorites()
}
