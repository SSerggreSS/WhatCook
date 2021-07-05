//
//  TabsViewController.swift
//  WhatCook
//
//  Created by Сергей  Бей on 03.07.2021.
//

import UIKit

protocol TabsViewControllerInput: AnyObject { }

class TabsViewController: UITabBarController {
    
    private var presenter: TabsPresenterInput?
    private var contollers: [UINavigationController]?

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .orange
        tabBar.unselectedItemTintColor = .gray
        selectedIndex = 0
    }
    
}

extension TabsViewController: TabsViewControllerInput {
    
}
