//
//  TabsFactory.swift
//  WhatCook
//
//  Created by Сергей  Бей on 05.07.2021.
//

import Foundation

class TabsFactory: BaseFactory {
    
    func createTabsViewController() -> TabsViewController? {
        let tc = container.resolve(TabsConfigurator.self)
        return tc?.tabsViewController
    }
    
}
