//
//  RecipeViewControllerOutput.swift
//  WhatCook
//
//  Created by Сергей  Бей on 14.06.2021.
//

import Foundation

protocol RecipeViewControllerOutput {
    func viewIsReady()
    func didSelectCell(with indexPath: IndexPath)
}
