//
//  TabsViewController.swift
//  WhatCook
//
//  Created by Сергей  Бей on 03.07.2021.
//

import UIKit

protocol TabsViewControllerInput: AnyObject { }

class TabsViewController: UITabBarController {
    
    var presenter: TabsPresenterInput?
    var contollers: [UINavigationController]?
 

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .red
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TabsViewController: TabsViewControllerInput {
    
}
