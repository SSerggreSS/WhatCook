//
//  RecipesDetailsViewController.swift
//  WhatCook
//
//  Created by Сергей  Бей on 16.05.2021.
//

import UIKit

protocol RecipesDetailsViewControllerInput: AnyObject {
    func updateInterfaceWith(_ recipe: Recipe)
    func updateTitle(text: String)
}

class RecipesDetailsViewController: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var detailsRecipeTableView: UITableView!
    
    //MARK: - Properties
    
    var presenter: RecipeDetailsPresenterInput!

    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        setupUserInterface()
        detailsRecipeTableView.delegate = self
        detailsRecipeTableView.dataSource = self
        detailsRecipeTableView.rowHeight = UITableView.automaticDimension
        presenter.viewDidLoad()
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
    
    private func setupUserInterface() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
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
            
            guard let recipeImageCell = detailsRecipeTableView.dequeueReusableCell(
                    withIdentifier: identRecipesDetailsCell
            ) as? RecipesDetailsImageViewCell else { return UITableViewCell() }
            
            recipeImageCell.presenter = RecipesDetailsImageViewCellPresenter(
                recipe: presenter.recipe,
                view: recipeImageCell
            )
            recipeImageCell.configureWith(presenter.recipe)
            
            return recipeImageCell
        } else {
            
            guard let descriptionCell = detailsRecipeTableView.dequeueReusableCell(
                    withIdentifier: identDescriptionCell
            ) as? DescriptionRecipesTableCellView else { return UITableViewCell() }
            
            descriptionCell.presenter = RecipeDetailsDescriptionViewCellPresenter(
                recipe: presenter.recipe,
                view: descriptionCell
            )
            
            descriptionCell.configureCellWith(recipe: presenter.recipe)
            return descriptionCell
        }

    }
    
}

//MARK: - UITableViewDelegate

extension RecipesDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//MARK: - RecipesDetailsViewControllerInput

extension RecipesDetailsViewController: RecipesDetailsViewControllerInput {
    
    func updateInterfaceWith(_ recipe: Recipe) {
        
    }
    
    func updateTitle(text: String) {
        navigationItem.title = text
    }
    
}




