//
//  FavoritesViewController.swift
//  WhatCook
//
//  Created by Сергей  Бей on 17.05.2021.
//

import UIKit
//этот протокол реализует презентер чтобы получать от вью сообщения
protocol FavoritesViewControllerOutput {
    func selectedCellBy(indexPath: IndexPath)
}

//этот протокол реализует вью контроллер чтобы получать сообщения от презентера
protocol FavoritesViewControllerInput {
    func fun()
}

class FavoritesViewController: UIViewController {

    @IBOutlet weak var favoritesCollectionView: UICollectionView!
    
    var presenter: FavoritesPresenterInput?
    
    let sectionEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: identRecipeCell, bundle: nil)
        favoritesCollectionView.register(nib, forCellWithReuseIdentifier: identRecipeCell)
        favoritesCollectionView.delegate = self
        favoritesCollectionView.dataSource = self
    }


}

extension FavoritesViewController: FavoritesViewControllerInput {
    func fun() {
        print("Hello from presenter")
    }
}

//MARK: - UICollectionViewDataSource

extension FavoritesViewController: UICollectionViewDataSource {
    
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

extension FavoritesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
    }
    
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

