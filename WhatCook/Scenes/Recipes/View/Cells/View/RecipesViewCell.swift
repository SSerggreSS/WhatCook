//
//  RecipesViewCell.swift
//  WhatCook
//
//  Created by Сергей  Бей on 16.05.2021.
//

import UIKit

class RecipesViewCell: UICollectionViewCell, Reusable {

    @IBOutlet weak var foodDishNameLabel: UILabel!
    @IBOutlet weak var foodDishImageView: UIImageView!
    
    let mainQueue = DispatchQueue.main

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        foodDishNameLabel.backgroundColor = .gray
    }

}


extension RecipesViewCell {
    func configureWith(_ presenter: RecipeCollectionCellPresenter) {
        self.foodDishNameLabel.text = presenter.recipe.name
    }
}

extension RecipesViewCell: RecipeCollectionCellInput {
    
    func updateTitle(text: String) {
        foodDishNameLabel.text = text
    }
    
    func updateMeal(image: UIImage?) {
        mainQueue.async { [weak self] in
            self?.foodDishImageView.image = image
        }
    }

}
