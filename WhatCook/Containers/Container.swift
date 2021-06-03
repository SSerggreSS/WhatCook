//
//  Container.swift
//  WhatCook
//
//  Created by Сергей  Бей on 03.06.2021.
//

import Foundation
import Swinject

class ServiceAssembly: Assembly {
    func assemble(container: Container) {
        container.register(RecipesProvider.self) { resolver in
           return resolver.resolve(RecipeProviderMock.self)!
        }
    }
}

//class ConfiguratorAssembly: Assembly {
////    func assemble(container: Container) {
////        <#code#>
////    }
//}

//class AppContainer {
//    private let container: Container = Container { contaier in
//        contaier.register(RecipesProvider.self) { recolver in
//            return RecipeProviderMock()
//        }
//    }
//}
