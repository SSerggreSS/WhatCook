//
//  NibLoadable.swift
//  WhatCook
//
//  Created by Сергей  Бей on 14.06.2021.
//

import Foundation
import UIKit

protocol NibLoadable: NSObject {
    static var nib: UINib { get }
}

extension NibLoadable {
    static var nib: UINib { return UINib(nibName: String(describing: self), bundle: Bundle(for: self)) }
}

