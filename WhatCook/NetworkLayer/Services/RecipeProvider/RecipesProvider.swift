//
//  RecipesProvider.swift
//  WhatCook
//
//  Created by Сергей  Бей on 03.06.2021.
//

import Foundation

class RecipesProvider: RecipeProviderProtocol {
    let jsonDecoder: JSONDecoder = JSONDecoder()
    func requestAll(completion: @escaping (Result<RecipeApiResponse, RecipeProviderError>) -> Void) {
        DispatchQueue.main.async {
            let request = NSMutableURLRequest(url: NSURL(string: "https://tasty.p.rapidapi.com/recipes/list?from=0&size=40&tags=under_30_minutes")! as URL,
                                                    cachePolicy: .useProtocolCachePolicy,
                                                timeoutInterval: 10.0)
            request.httpMethod = "GET"
            //request.allHTTPHeaderFields = headers

            let session = URLSession.shared
            let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                do {
                    guard let data = data else { return }
                    let recipeList = try self.jsonDecoder.decode(RecipeApiResponse.self, from: data)
                    completion(.success(recipeList))
                } catch {
                    completion(.failure(RecipeProviderError.writeError(error: error)))

                }

            })

            dataTask.resume()
            
        }
    }

    func update(recipe: Recipe, complition: @escaping (Result<(), RecipeProviderError>) -> Void) {
        DispatchQueue.global().async {
            complition(.success(()))
        }
    }
}
