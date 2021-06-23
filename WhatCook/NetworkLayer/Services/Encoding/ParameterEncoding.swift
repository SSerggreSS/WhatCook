//
//  ParameterEncoding.swift
//  WhatCook
//
//  Created by Сергей  Бей on 22.06.2021.
//

import Foundation

public typealias Parameters = [String : Any]

public protocol ParameterEncoder {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}
