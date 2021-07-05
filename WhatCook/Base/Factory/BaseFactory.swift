//
//  BaseFactory.swift
//  WhatCook
//
//  Created by Сергей  Бей on 05.07.2021.
//

import Foundation
import Swinject

protocol BaseFactoryProtocol {
    var container: Container! { get set }
    init(container: Container)
}

class BaseFactory: BaseFactoryProtocol {
    var container: Container!
    required init(container: Container) {
        self.container = container
    }
}
