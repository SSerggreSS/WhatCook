//
//  BasePresenter.swift
//  WhatCook
//
//  Created by Сергей  Бей on 29.06.2021.
//

import Foundation
import UIKit

protocol BasePresenterProtocol {
    var router: UIViewController? { get set }
}

class BasePresenter: BasePresenterProtocol {
    weak var router: UIViewController?
}
