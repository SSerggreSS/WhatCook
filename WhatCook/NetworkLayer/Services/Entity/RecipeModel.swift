//
//  RecipeModel.swift
//  WhatCook
//
//  Created by Сергей  Бей on 01.06.2021.
//

import Foundation

struct RecipeApiResponse {
    let numberOfResults: Int
    let recipes: [Recipe]
}

struct Recipe: Decodable {
    let name: String
    let imageUrl: String
}

extension Recipe {
    private enum RecipeCodingKeys: String, CodingKey {
        case name = "name"
       case imageUrl = "thumbnail_url"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RecipeCodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        imageUrl = try container.decode(String.self, forKey: .imageUrl)
    }
    
}

extension RecipeApiResponse: Decodable {
    
   private enum RecipeApiResponseCodingKeys: String, CodingKey {
        case numberOfResults = "count"
        case recipes = "results"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RecipeApiResponseCodingKeys.self)
        numberOfResults = try container.decode(Int.self, forKey: .numberOfResults)
        recipes = try container.decode([Recipe].self, forKey: .recipes)
    }
    
}

