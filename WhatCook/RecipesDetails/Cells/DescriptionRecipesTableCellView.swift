//
//  DescriptionRecipesTableCellView.swift
//  WhatCook
//
//  Created by Сергей  Бей on 28.05.2021.
//

import UIKit

class DescriptionRecipesTableCellView: UITableViewCell {

    
    @IBOutlet weak var recipeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
