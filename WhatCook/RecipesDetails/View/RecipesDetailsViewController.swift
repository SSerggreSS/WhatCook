//
//  RecipesDetailsViewController.swift
//  WhatCook
//
//  Created by Сергей  Бей on 16.05.2021.
//

import UIKit

class RecipesDetailsViewController: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var detailsRecipeTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        detailsRecipeTableView.delegate = self
        detailsRecipeTableView.dataSource = self
        detailsRecipeTableView.rowHeight = UITableView.automaticDimension

    }
    


}

extension RecipesDetailsViewController {
    
    //MARK: - Help Functions
    
    private func registerCells() {
        let nibRecipesDetailsCell = UINib(nibName: identRecipesDetailsCell, bundle: nil)
        detailsRecipeTableView.register(nibRecipesDetailsCell, forCellReuseIdentifier: identRecipesDetailsCell)
        let nibDescriptionCell = UINib(nibName: identDescriptionCell, bundle: nil)
        detailsRecipeTableView.register(nibDescriptionCell, forCellReuseIdentifier: identDescriptionCell)
    }
    
}

extension RecipesDetailsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let recipeCell = tableView.dequeueReusableCell(withIdentifier: identRecipesDetailsCell, for: indexPath)
            return recipeCell
        } else {
            let descriptionCell = tableView.dequeueReusableCell(withIdentifier: identDescriptionCell, for: indexPath)
            return descriptionCell
        }

    }
    
    
    
}

//MARK: - UITableViewDelegate

extension RecipesDetailsViewController: UITableViewDelegate {

}




