//
//  EnteringProductsViewController.swift
//  WhatCook
//
//  Created by Сергей  Бей on 16.05.2021.
//

import UIKit
import Foundation
import AMTagListView

class EnteringProductsViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    var tagListView: AMTagListView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tagListView = AMTagListView(frame: containerView.bounds)
        tagListView.backgroundColor = .blue
        tagListView.addTag("test tag")
        
        containerView.addSubview(tagListView)
 
      
            
        
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

extension EnteringProductsViewController: UIScrollViewDelegate {
    
}
