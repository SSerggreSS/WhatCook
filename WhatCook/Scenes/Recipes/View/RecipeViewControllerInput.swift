//
//  RecipeViewControllerInput.swift
//  WhatCook
//
//  Created by Сергей  Бей on 14.06.2021.
//

import Foundation

protocol RecipeViewControllerInput {
    func reloadData()
    func updateTitle(_ text: String)
}
