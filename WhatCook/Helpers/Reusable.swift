//
//  Reusable.swift
//  WhatCook
//
//  Created by Сергей  Бей on 12.06.2021.
//

import Foundation

protocol Reusable {
    static var reusableIdentifier: String { get }
}

extension Reusable {
    static var reusableIdentifier: String {
        return String(describing: self)
    }
}
