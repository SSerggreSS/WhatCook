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
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var presenter: RecipeCollectionCellPresenter!
    
    let mainQueue = DispatchQueue.main
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        foodDishNameLabel.backgroundColor = .black
        self.setCornerRadiusWith(10)
    }

}


extension RecipesViewCell {
    func configureWith(_ presenter: RecipeCollectionCellPresenter) {
        self.presenter = presenter
        self.presenter.view = self
        self.foodDishNameLabel.text = presenter.recipe.name
        self.presenter.viewIsReady()
    }
}

extension RecipesViewCell: RecipeCollectionCellInput {
    
    func updateTitle(text: String) {
        foodDishNameLabel.text = text
    }
    
    func updateMealImageWith(data: Data) {
        mainQueue.async { [weak self] in
            self?.foodDishImageView.image = UIImage(data: data)
            self?.activityIndicator.stopAnimating()
        }
    }

}
