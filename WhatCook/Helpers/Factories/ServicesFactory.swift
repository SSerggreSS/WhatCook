//
//  ServicesFactory.swift
//  WhatCook
//
//  Created by Сергей  Бей on 27.06.2021.
//

import Foundation
import Swinject

protocol BaseFactoryProtocol {
    var container: Container { get set }
    init(mainContainer: Container)
}

class BaseFactory: BaseFactoryProtocol {
    var container: Container
    
    required init(mainContainer: Container) {
        self.container = mainContainer
    }
    
}

//MARK: - ImageUploadServiceFactoryProtocol

protocol ImageUploadServiceFactoryProtocol {
    func createImageUploadService() -> ImageUploadServiceProtocol
}

class ImageUploadServiceFactory: BaseFactory, ImageUploadServiceFactoryProtocol {
    func createImageUploadService() -> ImageUploadServiceProtocol {
        return container.resolve(ImageUploadServiceProtocol.self)!
    }
}

