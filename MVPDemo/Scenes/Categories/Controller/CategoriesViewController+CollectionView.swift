//
//  CategoriesViewController+CollectionView.swift
//  MVPDemo
//
//  Created by Mustafa on 3/7/20.
//  Copyright © 2020 Mostafa. All rights reserved.
//

import UIKit
//MARK: - Extension

//MARK:-UICollectionViewDelegate And UICollectionViewDataSource

extension CategoriesViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    
    func setUpCollectionView(){
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  presenter.getCategoriesCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionViewCell", for: indexPath) as! CategoriesCollectionViewCell
        let cellIndex = indexPath.item
        if   cellIndex == 0  {
            RoundedCollection.topLeft(view: cell.contentView)
        }
        else if   cellIndex == 1  {
            RoundedCollection.topRight(view: cell.contentView)
        }
        else if   cellIndex == (presenter.getCategoriesCount() ) - 2  {
            RoundedCollection.bootemLeft(view: cell.contentView)
        }
        else if   cellIndex == (presenter.getCategoriesCount()) - 1  {
            RoundedCollection.bootemRight(view: cell.contentView)
        }else {
            RoundedCollection.simpleView(view: cell.contentView)
        }
        presenter.configure(cell: cell, for: cellIndex)
       
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         presenter.didSelectRow(index: indexPath.row)
    }
    
}



//MARK:-UICollectionViewDelegateFlowLayout

extension CategoriesViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let cellSize = CGSize(width: self.view.frame.width / 2 - 20 , height: 165)
        return cellSize
    }
}
