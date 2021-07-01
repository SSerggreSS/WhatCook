//
//  RealRecipeModel.swift
//  WhatCook
//
//  Created by Сергей  Бей on 01.07.2021.
//

import Foundation
import RealmSwift

class RRecipe: Object {
    
    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var imageUrl: String = ""
    let instructions = List<RInstruction>()
    @objc dynamic var imageData: Data = Data()
    
    @objc dynamic var isFavorite: Bool = false
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

class RInstruction: Object {
    @objc dynamic var displayText: String = ""
}
