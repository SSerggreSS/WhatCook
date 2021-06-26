//
//  RecipeViewControllerInput.swift
//  WhatCook
//
//  Created by Сергей  Бей on 14.06.2021.
//

import Foundation

protocol RecipeViewControllerInput {
    
    /// Get new data and update
    func reloadData()
    
    /// Talk view update title navigation bar
    func updateTitle(_ text: String)
    
    /// Talk view show geted recipes
    func show(recipes: [Recipe])
}
