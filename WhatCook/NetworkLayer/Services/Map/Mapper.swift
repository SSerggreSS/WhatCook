//
//  Mapper.swift
//  WhatCook
//
//  Created by Сергей  Бей on 01.07.2021.
//

import Foundation

class Mapper<T,J> {
    
    class func mapTo(item: T) -> J? {
        return nil
    }
    
    class func mapFrom(item: J) -> T? {
        return nil
    }
    
}
