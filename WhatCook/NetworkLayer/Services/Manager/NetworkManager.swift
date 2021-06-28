//
//  NetworkManager.swift
//  WhatCook
//
//  Created by Сергей  Бей on 23.06.2021.
//

import Foundation

protocol NetworkManagerProtocol {
    func getNewRecipes(completion: @escaping (_ recipes: [Recipe]?, _ error: String?) -> Void)
}

class NetworkManager: NetworkManagerProtocol {
    
    static let environment: NetworkEnvironment = .production
    static let recipeAPIKey = ""
    private let router = Router<RecipeApi>()
    
    
    ///Ответы на запросы
    enum NetworkResponse: String {
        case success
        case authenticationError = "You need to be authenticated first."
        case badRequest = "Bad request."
        case outdated = "The url you requested is outdated."
        case failed = "Network request failed."
        case noData = "Response returned with no data to decode."
        case unableToDecode = "We could not decode the response."
    }
    
    ///Определяем успешный запрос или провален
    enum Result<String> {
        case success
        case failed(String)
    }
    
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
        switch response.statusCode {
        case 200...299: return .success
        case 401...500: return .failed(NetworkResponse.authenticationError.rawValue)
        case 501...599: return .failed(NetworkResponse.badRequest.rawValue)
        case 600: return .failed(NetworkResponse.outdated.rawValue)
        default: return .failed(NetworkResponse.failed.rawValue)
        }
    }
    
    func getNewRecipes(completion: @escaping (_ recipes: [Recipe]?, _ error: String?) -> Void) {
        router.request(.list) { data, response, error in
            if error != nil {
                completion(nil, "Please check your network connection.")
            }
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        let apiResponse = try JSONDecoder().decode(RecipeApiResponse.self,
                                                                   from: responseData)
                        completion(apiResponse.recipes, nil)
                    } catch {
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failed(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
    }
    
}
