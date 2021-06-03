//
//  RecipesViewController.swift
//  WhatCook
//
//  Created by Сергей  Бей on 16.05.2021.
//

import UIKit

class RecipesViewController: UIViewController {

    @IBOutlet weak var recipesCollectionView: UICollectionView!
    
    let sectionEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    var dataWasRequestedFromTheServer = false
    
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

