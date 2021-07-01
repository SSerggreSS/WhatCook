//
//  DBServiceProtocol.swift
//  WhatCook
//
//  Created by Сергей  Бей on 01.07.2021.
//

import Foundation
import RealmSwift

protocol DataBaseServiceProtocol: AnyObject {
    
    var realm: Realm { get }
    
    ///Получить все обьекты из базы рилма
    func readObjects(completionHandler: @escaping (([RRecipe]?) -> Void))
    
    ///Сохранить обьекты в базу рилма
    func writeObject(_ objects: [RRecipe], succesCompletion: @escaping (() -> Void))
    
    ///Удалить обьекты в из базы рилма
    func deleteObject(_ objects: [Object], succesCompletion: @escaping (() -> Void))
    
}
