//
//  RecipeEndPoint.swift
//  WhatCook
//
//  Created by Сергей  Бей on 23.06.2021.
//

import Foundation

enum NetworkEnvironment {
    case qa
    case production
    case staging
}

enum RecipeApi {
    case list
    case recipe(name: String)
    case recipe(id: String)
}

extension RecipeApi: EndPointType {
    
    var environmentBaseURL: String {
        switch NetworkManager.environment {
        case .production: return "https://tasty.p.rapidapi.com/recipes/list?from=0&size=20&tags=under_30_minutes"
        default:
            return ""
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else {
            fatalError("baseURL could not be configured.")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .list:
            return ""
        default:
            return ""
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var httpTask: HTTPTask {
        switch self {
        case .list:
            return .request
        default:
            return .request
        }
    }
    
    var headers: HTTPHeaders? {
        let headers = [
            "x-rapidapi-key": "",
            "x-rapidapi-host": "tasty.p.rapidapi.com"
        ]
        return headers
    }
}
