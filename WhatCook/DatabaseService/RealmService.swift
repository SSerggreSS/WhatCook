//
//  RealmService.swift
//  WhatCook
//
//  Created by Сергей  Бей on 01.07.2021.
//

import RealmSwift


class RealmService: DataBaseServiceProtocol {
    
    
    private let realmDatabase: Realm!
    
    private let queueBackground = DispatchQueue(label: "background")
    
    init() {
        realmDatabase = try! Realm()
    }
    
    var realm: Realm {
        return self.realmDatabase
    }
    
    func writeObject(_ objects: [RRecipe], succesCompletion: @escaping (() -> Void)) {
        
                 realmDatabase.beginWrite()
                 realmDatabase.add(objects)
            try! realmDatabase.commitWrite()
        
            succesCompletion()
    }
    
    func readObjects(completionHandler: @escaping (([RRecipe]?) -> Void)) {
        var objects: [RRecipe]?
    
        let results = self.realmDatabase.objects(RRecipe.self)
        if !results.isEmpty {
            objects = [RRecipe]()
        } else {
            completionHandler(nil)
            return
        }
        
        for r in results {
            objects?.append(r)
        }
        completionHandler(objects)
    }
    
    func deleteObject(_ objects: [Object], succesCompletion: @escaping (() -> Void)) {
        
        self.realmDatabase.beginWrite()
        for o in objects {
            self.realmDatabase.delete(o)
        }
        try! self.realmDatabase.commitWrite()
        
        succesCompletion()
    }
    
}
