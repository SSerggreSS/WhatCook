//
//  RecipesDetailsImageViewCell.swift
//  WhatCook
//
//  Created by Сергей  Бей on 28.05.2021.
//

import UIKit

protocol RecipesDetailsImageViewCellInput: AnyObject {
    ///обновляет интерфейс с помощью модели рецепта
    func updateInterfaceWith(_ recipe: Recipe)
}

class RecipesDetailsImageViewCell: UITableViewCell {

    //MARK: - Outlets
    
    @IBOutlet weak var recipesImageView: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var nameMealLabel: UILabel!
    
    //MARK: - Properties
    
    var presenter: RecipesDetailsImageViewCellPresenterInput!
     
    
    //MARK: - Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

//MARK: - Extensions

extension RecipesDetailsImageViewCell {
    func configureWith(_ recipe: Recipe) {
        nameMealLabel.text = recipe.name
        guard let imageData = recipe.imageData else { return }
        recipesImageView.image = UIImage(data: imageData)
    }
}

extension RecipesDetailsImageViewCell: RecipesDetailsImageViewCellInput {
    func updateInterfaceWith(_ recipe: Recipe) {
        nameMealLabel.text = recipe.name
    }
}
