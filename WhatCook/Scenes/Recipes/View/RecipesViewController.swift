//
//  RecipesViewController.swift
//  WhatCook
//
//  Created by Сергей  Бей on 16.05.2021.
//

import UIKit

class RecipesViewController: UIViewController {

    @IBOutlet weak var recipesCollectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    private var presenter: RecipeViewControllerOutput?
    private var collectionViewDataSource: CollectionViewDataSource?
    let sectionEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    let mainQueue = DispatchQueue.main
    
    convenience init(presenter: RecipeViewControllerOutput,
                     dataProvider: RecipesCollectionViewDataProviderProtocol) {
        self.init()
        self.presenter = presenter
        self.collectionViewDataSource = CollectionViewDataSource(dataProvider: dataProvider)
    
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUserInterface()
        let nib = UINib(nibName: RecipesViewCell.reusableIdentifier, bundle: nil)
        recipesCollectionView.register(
            nib,
            forCellWithReuseIdentifier: RecipesViewCell.reusableIdentifier
        )
        presenter?.viewIsReady()
    }
    
}

private extension RecipesViewController {
    func setupUserInterface() {
        activityIndicator.startAnimating()
        self.activityIndicator.hidesWhenStopped.toggle()
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.red,
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Light", size: 30)!
        ]
        
        navigationController?.navigationBar.tintColor = .gray
        recipesCollectionView?.backgroundColor = .systemOrange
        recipesCollectionView.dataSource = collectionViewDataSource
        recipesCollectionView.delegate = self
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
        let widthPerItem: CGFloat = UIScreen.main.bounds.width - sectionEdgeInsets.left
        return CGSize(width: widthPerItem, height: widthPerItem * 0.8)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.didSelectCell(with: indexPath)
    }
    
}

//MARK: - UICollectionViewDataSource

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
            guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: presenter.reusableType.reusableIdentifier,
                    for: indexPath
            ) as? RecipesViewCell else {
                return UICollectionViewCell()
            }
            cell.configureWith(presenter)
            return cell
        }
    }
}

extension RecipesViewController: RecipeViewControllerInput {
    
    func reloadData() {
        mainQueue.async {
            self.activityIndicator.stopAnimating()
            self.recipesCollectionView.reloadData()
        }
    }
    
    func updateTitle(_ text: String) {
        navigationItem.title = text
    }
    
}
