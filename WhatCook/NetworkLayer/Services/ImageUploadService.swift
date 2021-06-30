//
//  ImageUploadService.swift
//  WhatCook
//
//  Created by Сергей  Бей on 27.06.2021.
//

import Foundation
import UIKit

enum ResultRequestImageError: String, Error {
    case failedToGetURL = "Failed To Get URL by string"
    case failedToGetData = "Failed to get data by URL"
}

typealias ResultRequestImage = ((Result<Data, ResultRequestImageError>) -> Void)

protocol ImageUploadServiceProtocol {
    
    var queue: DispatchQueue { get set }
    ///Делает запрос по строке url и возвращает данные для картинки
    func getImageDataBy(urlString: String, completeon: @escaping ResultRequestImage)
}

class ImageUploadService: ImageUploadServiceProtocol {
    
    internal var queue: DispatchQueue = .global(qos: .utility)
    
    func getImageDataBy(urlString: String, completeon: @escaping ResultRequestImage) {
        queue.async {
            guard let url = URL(string: urlString) else {
                completeon(.failure(.failedToGetURL))
                return
            }
            guard let data = try? Data(contentsOf: url) else {
                completeon(.failure(.failedToGetData))
                return
            }
            completeon(.success(data))
        }
    }
    
}
