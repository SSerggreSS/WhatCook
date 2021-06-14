//
//  RecipesProvider.swift
//  WhatCook
//
//  Created by Сергей  Бей on 03.06.2021.
//

import Foundation

class RecipesProviderMock: RecipeProviderProtocol {
    func requestAll(completion: @escaping (Result<[Recipe], RecipeProviderError>) -> Void) {
        DispatchQueue.main.async {
            guard let data = recipesJSON.data(using: .utf8) else { return }
            let jsonDecoder = JSONDecoder()
            do {
                let recipes = try jsonDecoder.decode([Recipe].self, from: data) as [Recipe]
                completion(.success(recipes))
            } catch let error {
                completion(.failure(RecipeProviderError.writeError(error: error)))
            }
        }
    }
    
    func update(recipe: Recipe, complition: @escaping (Result<(), RecipeProviderError>) -> Void) {
        DispatchQueue.global().async {
            complition(.success(()))
        }
    }
    

}


private let recipesJSON = """
    [
        {
            "id"   : 1,
            "name" : "borscht",
            "description" : "cut, boil, pour",
        },
        {
            "id"   : 2,
            "name" : "borscht",
            "description" : "cut, boil, pour",
        },
        {
            "id"   : 3,
            "name" : "borscht",
            "description" : "cut, boil, pour",
        },
    
    ]
"""
