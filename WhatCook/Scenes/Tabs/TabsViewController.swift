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
 
    convenience init(tabControllers: [UINavigationController], presenter: TabsPresenterInput) {
       self.init()
        self.contollers = tabControllers
        self.presenter = presenter
   }

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
