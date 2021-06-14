//
//  RecipePresenter.swift
//  WhatCook
//
//  Created by Сергей  Бей on 14.06.2021.
//

import Foundation

class RecipePresenter {
    let collectionData: RecipeCollectionDataProvider
    private var cellPresenters: [RecipeCollectionCellPresenter] = []
    private var title = "Recipe"
    
    var viewController: RecipeViewControllerInput?
    
    init(collectionData: RecipeCollectionDataProvider) {
        self.collectionData = collectionData
    }
}

extension RecipePresenter: RecipeViewControllerOutput {
    func viewIsReady() {
        updateTitle()
    }
    func didSelectCell(with indexPath: IndexPath) {
        guard cellPresenters.indices.contains(indexPath.row) else { return }
        let presenter = cellPresenters[indexPath.row]
        //TODO: open details recipe
    }
}

extension RecipePresenter {
    func updateTitle() {
        viewController?.updateTitle(title)
    }
    func updateCellPresenters() {
        collectionData.updateCellPresenters(cellPresenters)
        viewController?.reloadData()
    }
}
