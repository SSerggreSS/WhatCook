//
//  NetworkError.swift
//  WhatCook
//
//  Created by Сергей  Бей on 22.06.2021.
//

import Foundation

public enum NetworkError : String, Error {
    case parametersNil = "Parameters were nil"
    case encodingFailed = "Parameter encoding failed"
    case missingURL = "URL is nil"
}
