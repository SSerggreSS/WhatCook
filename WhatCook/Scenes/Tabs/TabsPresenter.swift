//
//  TabsPresenter.swift
//  WhatCook
//
//  Created by Сергей  Бей on 03.07.2021.
//

import Foundation
import UIKit

protocol TabsPresenterInput: BasePresenterInput { }

class TabsPresenter {
    
    weak var view: TabsViewControllerInput?
    
    
    
}

extension TabsPresenter: TabsPresenterInput {
    func viewDidLoad() {
        
    }
}
