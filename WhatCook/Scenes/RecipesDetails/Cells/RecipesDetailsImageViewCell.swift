//
//  RecipesDetailsImageViewCell.swift
//  WhatCook
//
//  Created by Сергей  Бей on 28.05.2021.
//

import UIKit

class RecipesDetailsImageViewCell: UITableViewCell {

    //MARK: - Outlets
    

    @IBOutlet weak var recipesImageView: UIImageView!
    
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var nameMealLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
