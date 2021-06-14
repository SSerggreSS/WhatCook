//
//  UICollectionView+dequeueReusableCell.swift
//  WhatCook
//
//  Created by Сергей  Бей on 14.06.2021.
//

import Foundation
import UIKit

extension UICollectionView {
    func dequeueReusableCell(with presenter: RecipeCollectionCellPresenter, indexPath: IndexPath) -> UICollectionViewCell {
        return self.dequeueReusableCell(withReuseIdentifier: presenter.reusableType.reusableIdentifier, for: indexPath)
    }
    
    func registerReusableCell(_ type: NibReusable) {
        
    }
    
}
