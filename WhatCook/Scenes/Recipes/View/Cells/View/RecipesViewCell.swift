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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
