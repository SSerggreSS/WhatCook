//
//  RecipesProvider.swift
//  WhatCook
//
//  Created by Сергей  Бей on 03.06.2021.
//

import Foundation

protocol RecipesProvider {
    func f()
}

class RecipeProviderMock: RecipesProvider {
    func f() {
        print(#function)
    }
}
