//
//  ImageUploadService.swift
//  WhatCook
//
//  Created by Сергей  Бей on 27.06.2021.
//

import Foundation
import UIKit

protocol ImageUploadServiceProtocol {
    
    var queue: DispatchQueue { get set }
    ///Делает запрос по строке url и возвращает картинку
    func getImageBy(urlString: String) -> UIImage?
}

class ImageUploadService: ImageUploadServiceProtocol {

    var queue: DispatchQueue = .global()
    
    func getImageBy(urlString: String) -> UIImage? {
        guard let url = URL(string: urlString) else { return nil }
        guard let data = try? Data(contentsOf: url) else { return nil}
        return UIImage(data: data)
    }
    
}
