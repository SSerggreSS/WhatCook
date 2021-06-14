//
//  RecipCollectionCellInput.swift
//  WhatCook
//
//  Created by Сергей  Бей on 12.06.2021.
//

import Foundation

protocol RecipeCollectionCellInput: AnyObject {
    func updateTitle(text: String)
    func updateCompletionState(isCompleted: Bool)
}
