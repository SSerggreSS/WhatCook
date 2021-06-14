//
//  RecipesViewController.swift
//  WhatCook
//
//  Created by Сергей  Бей on 16.05.2021.
//

import UIKit

class RecipesViewController: UIViewController {

    @IBOutlet weak var recipesCollectionView: UICollectionView!
    private var presenter: RecipeViewControllerOutput?
    private var collectionViewDataSource: CollectionViewDataSource?
    let sectionEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    var dataWasRequestedFromTheServer = false
    
    convenience init(presenter: RecipeViewControllerOutput,
                     dataProvider: RecipesCollectionViewDataProviderProtocol) {
        self.init()
        self.presenter = presenter
        self.collectionViewDataSource = CollectionViewDataSource(dataProvider: dataProvider)
    
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipesCollectionView?.backgroundColor = .red
        recipesCollectionView.dataSource = self
        recipesCollectionView.delegate = self
        let nib = UINib(nibName: identRecipeCell, bundle: nil)
        recipesCollectionView.register(nib, forCellWithReuseIdentifier: identRecipeCell)
    }
    
}

//MARK: - UICollectionViewDataSource

extension RecipesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identRecipeCell, for: indexPath)
        return cell
    }
    
}

//MARK: - UICollectionViewDelegateFlowLayout

extension RecipesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionEdgeInsets.left
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionEdgeInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let widthPerItem: CGFloat = 100
        let heightPerItem: CGFloat = 100
    
        
        return CGSize(width: widthPerItem, height: heightPerItem)
    }
    
}

private extension RecipesViewController {
    class CollectionViewDataSource: NSObject, UICollectionViewDataSource {
        
        private let dataProvider: RecipesCollectionViewDataProviderProtocol
        
        init(dataProvider: RecipesCollectionViewDataProviderProtocol) {
            self.dataProvider = dataProvider
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return dataProvider.numberOfRows(in: section)
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let presenter = dataProvider.cellForRow(at: indexPath)
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: presenter.reusableType.reusableIdentifier, for: indexPath)
            return cell
        }
        
        
    }
}

extension RecipesViewController: RecipeViewControllerInput {
    func reloadData() {
        recipesCollectionView.reloadData()
    }
    
    func updateTitle(_ text: String) {
        navigationItem.title = text
    }
    
    
}
