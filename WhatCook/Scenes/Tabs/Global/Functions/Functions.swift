//
//  Functions.swift
//  WhatCook
//
//  Created by Сергей  Бей on 01.07.2021.
//

import Foundation

func local(_ key: String, _ tableName: String) -> String {
    return NSLocalizedString(key, tableName: tableName, bundle: Bundle.main, value: "", comment: "")
}
