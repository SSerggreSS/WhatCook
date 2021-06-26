//
//  ServiceFactory.swift
//  WhatCook
//
//  Created by Сергей  Бей on 27.06.2021.
//

import Foundation
import Swinject






protocol ImageUploadServiceFactoryProtocol {
    func createImageUploadService() -> ImageUploadServiceProtocol
}

class ImageUploadServiceFactory: ImageUploadServiceFactoryProtocol {
    
    var container: Container!
    
    init(mainContainer: Container) {
        container = mainContainer
    }
    
    func createImageUploadService() -> ImageUploadServiceProtocol {
        return container.resolve(ImageUploadServiceProtocol.self)!
    }
}

