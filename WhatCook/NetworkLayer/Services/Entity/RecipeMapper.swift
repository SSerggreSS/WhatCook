//
//  RecipeMapper.swift
//  WhatCook
//
//  Created by Сергей  Бей on 01.07.2021.
//

import Foundation
import RealmSwift

class RecipeMapper: Mapper<Recipe, RRecipe> {
    
    override class func mapTo(item: Recipe) -> RRecipe? {
        
        let realmRecipe = RRecipe()
        realmRecipe.id = String(item.id)
        realmRecipe.name = item.name
        realmRecipe.imageUrl = item.imageUrl
        realmRecipe.imageData = item.imageData ?? Data()
        
        item.instructions.forEach { inst in
            let realmInstruction = RInstruction()
            realmInstruction.displayText = inst.displayText
            realmRecipe.instructions.append(realmInstruction)
        }
        
       return realmRecipe
    }
    
    override class func mapFrom(item: RRecipe) -> Recipe? {
        
        var recipe = Recipe()
        recipe.id = Int(item.id) ?? 0
        recipe.name = item.name
        recipe.imageUrl = item.imageUrl
        item.instructions.forEach { inst in
            let instruction = Instruction(displayText: inst.displayText)
            recipe.instructions.append(instruction)
        }
        recipe.imageData = item.imageData
    
        return recipe
    }
    
}
