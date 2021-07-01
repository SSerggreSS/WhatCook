//
//  RecipCollectionCellInput.swift
//  WhatCook
//
//  Created by Сергей  Бей on 12.06.2021.
//

import Foundation
import UIKit

protocol RecipeCollectionCellInput: AnyObject {
    /// Обновить заголовок
    func updateTitle(text: String)
    
    /// Обновить картинку еды
    func updateMealImageWith(data: Data)
    
    ///Установить картинку с помощью данных
    func setFavoriteButtonImageWith(name: String)
}
