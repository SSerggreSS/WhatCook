//
//  RecipeProviderProtocol.swift
//  WhatCook
//
//  Created by Сергей  Бей on 10.06.2021.
//

import Foundation

enum RecipeProviderError: Error {
    case writeError(error: Error?)
}

protocol RecipeProviderProtocol {
    func requestAll(completion: @escaping (Result<RecipeApiResponse, RecipeProviderError>) -> Void)
    func update(recipe: Recipe, complition: @escaping (Result<(), RecipeProviderError>) -> Void)
}
