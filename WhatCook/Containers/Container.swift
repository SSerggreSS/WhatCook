//
//  Container.swift
//  WhatCook
//
//  Created by Сергей  Бей on 03.06.2021.
//

import Foundation
import Swinject
import UIKit

class ServiceAssembly: Assembly {
    func assemble(container: Container) {
        container.register(RecipeProviderProtocol.self) { _ in
            return RecipesProvider()
        }
    }
}

class ConfiguratorAssembly: Assembly {
    func assemble(container: Container) {
        container.register(RecipesConfigurator.self) { resolver in
            RecipesConfigurator(recipesProvider: resolver.resolve(RecipeProviderProtocol.self)! ,
                                collectionDataProviderFactory: resolver.resolve(RecipesCollectionDataProviderFactoryProtocol.self)!,
                                cellPresenterFactory: resolver.resolve(RecipeCellPresenterFactoryProtocol.self)!)
        }
    }
}

class FactoryAssembly: Assembly {
    func assemble(container: Container) {
        container.register(RecipesCollectionDataProviderFactoryProtocol.self) { _ in
            RecipesCollectionDataProviderFactory()
        }
        container.register(RecipeCellPresenterFactoryProtocol.self) { _ in
            RecipeCellPresenterFactory()
        }
    }
}

protocol Configurator {
    func configure() -> UIViewController
}

protocol AppSeviceProtocol {
    func start() -> Configurator
}

class AppService: AppSeviceProtocol {
    
    private let assembler: Assembler
    
    private var resolver: Resolver {
        return assembler.resolver
    }
    
    init() {
        let serviceAssembly = ServiceAssembly()
        let factoryAssembly = FactoryAssembly()
        let configuratorAssembly = ConfiguratorAssembly()
        
        assembler = Assembler(
            [
                serviceAssembly,
                factoryAssembly,
                configuratorAssembly
            ]
        )
        
    }
    
    
    func start() -> Configurator {
        return resolver.resolve(RecipesConfigurator.self)!
    }
    
    
}


