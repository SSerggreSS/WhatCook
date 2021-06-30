//
//  DescriptionRecipesTableCellView.swift
//  WhatCook
//
//  Created by Сергей  Бей on 28.05.2021.
//

import UIKit

protocol DescriptionRecipesTableCellViewInput: AnyObject {
    func updateInterfaceWith(_ recipe: Recipe)
}

class DescriptionRecipesTableCellView: UITableViewCell {

    //MARK: - Outlets
    
    @IBOutlet weak var recipeLabel: UILabel!
    
    //MARK: - Properties
    
    var presenter: RecipeDetailsDescriptionViewCellPresenterInput?
    
    
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

extension DescriptionRecipesTableCellView {
    
    func configureCellWith(recipe: Recipe) {
        recipeLabel.text = recipe.instructions.first?.displayText
    }
    
}


//MARK: - DescriptionRecipesTableCellView

extension DescriptionRecipesTableCellView: DescriptionRecipesTableCellViewInput {
    func updateInterfaceWith(_ recipe: Recipe) {
        recipeLabel.text = recipe.instructions.first?.displayText
    }
}

