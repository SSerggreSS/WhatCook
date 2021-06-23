//
//  EndPointType.swift
//  WhatCook
//
//  Created by Сергей  Бей on 21.06.2021.
//

import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var httpTask: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}
