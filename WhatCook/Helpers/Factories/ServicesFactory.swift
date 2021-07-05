//
//  ServicesFactory.swift
//  WhatCook
//
//  Created by Сергей  Бей on 27.06.2021.
//

import Foundation
import Swinject

//MARK: - ImageUploadServiceFactoryProtocol

protocol ImageUploadServiceFactoryProtocol {
    func createImageUploadService() -> ImageUploadServiceProtocol
}

class ImageUploadServiceFactory: BaseFactory, ImageUploadServiceFactoryProtocol {
    func createImageUploadService() -> ImageUploadServiceProtocol {
        return container.resolve(ImageUploadServiceProtocol.self)!
    }
}

