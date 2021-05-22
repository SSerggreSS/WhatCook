//
//  ViewController.swift
//  WhatCook
//
//  Created by Сергей  Бей on 16.05.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "EnteringProductsViewController", bundle: bundle)
        let view = nib.instantiate(withOwner: EnteringProductsViewController.self, options: nil).first as! UIView
        self.view = view
    }


}

