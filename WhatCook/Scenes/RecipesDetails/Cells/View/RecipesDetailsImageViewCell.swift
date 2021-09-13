//
//  RecipesDetailsImageViewCell.swift
//  WhatCook
//
//  Created by Сергей  Бей on 28.05.2021.
//

import UIKit
import MarqueeLabel

protocol RecipesDetailsImageViewCellInput: AnyObject {
    ///обновляет интерфейс с помощью модели рецепта
    func updateInterfaceWith(_ recipe: Recipe)
    
    ///Установить картинку для кнопки добавления в избранное
    func setFavoriteButtonImageWith(name: String)
    
}

class RecipesDetailsImageViewCell: UITableViewCell {

    //MARK: - Outlets
    
    @IBOutlet weak var recipesImageView: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var nameMealLabel: MarqueeLabel!
    
    //MARK: - Properties
    
    var presenter: RecipesDetailsImageViewCellPresenterInput!
     
    //MARK: - Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUserInterface()
    }

    @IBAction func onFavoriteButtonAction(_ sender: UIButton) {
        presenter.addOrDeleteRecipeInFavorites()
    }
    
    
}

//MARK: - Private Help Functions

private extension RecipesDetailsImageViewCell {
    func setupUserInterface() {
        self.selectionStyle = .none
        favoriteButton.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
    }
}

//MARK: - Open Help Functions

extension RecipesDetailsImageViewCell {
    func configureWith(_ recipe: Recipe) {
        nameMealLabel.text = recipe.name
        guard let imageData = recipe.imageData else { return }
        recipesImageView.image = UIImage(data: imageData)
    }
}

extension RecipesDetailsImageViewCell: RecipesDetailsImageViewCellInput {
    func setFavoriteButtonImageWith(name: String) {
        if #available(iOS 13.0, *) {
            DispatchQueue.main.async {
                self.favoriteButton.imageView?.image = UIImage(systemName: name)
            }
        }
    }
    
    func updateInterfaceWith(_ recipe: Recipe) {
        nameMealLabel.text = recipe.name
    }
}
