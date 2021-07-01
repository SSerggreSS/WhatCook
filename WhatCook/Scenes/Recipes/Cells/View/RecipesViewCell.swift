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
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    var presenter: RecipeCollectionViewCellOutput!
    
    let mainQueue = DispatchQueue.main
    
    override func prepareForReuse() {
        super.prepareForReuse()
        foodDishImageView.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUserInterface()
    }
    
    @IBAction func onFavoriteButton(_ sender: UIButton) {
        presenter.addOrDeleteRecipeInFavorites()
    }
    
}

//MARK: - Private Help functions

private extension RecipesViewCell {
    func setupUserInterface() {
        activityIndicator.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        favoriteButton.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        foodDishNameLabel.backgroundColor = .black
        self.setCornerRadiusWith(10)
        foodDishNameLabel.setCornerRadiusWith(10)
    }
}

//MARK: - Open Help functions

extension RecipesViewCell {
    
    func configureWith(_ presenter: RecipeCollectionCellPresenter) {
        self.presenter = presenter
        self.presenter.view = self
        self.foodDishNameLabel.text = presenter.recipe.name
        activityIndicator.startAnimating()
        foodDishImageView.image = UIImage(named: "clockBlack")
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

    func setFavoriteButtonImageWith(name: String) {
        if #available(iOS 13.0, *) {
            DispatchQueue.main.async {
                self.favoriteButton.imageView?.image = UIImage(systemName: name)
            }
        }
    }
}
