//
//  FavoritesProvider.swift
//  WhatCook
//
//  Created by Сергей  Бей on 03.06.2021.
//

import Foundation

protocol FavoritesProvider {
    func f()
}

class FavoritesProviderMock: FavoritesProvider {
    func f() {
        print(#function)
    }
}
