//
//  CategoriesViewController+PresenterDelegate.swift
//  MVPDemo
//
//  Created by Mustafa on 3/8/20.
//  Copyright © 2020 Mostafa. All rights reserved.
//

import Foundation
import NVActivityIndicatorView
extension CategoriesViewController : CategoriesView,NVActivityIndicatorViewable {
    
    func showIndicator() {
        self.startAnimating()
    }
    
    func hideIndicator() {
        self.stopAnimating()
    }
    
    func fetchingDataSuccess() {
        categoriesCollectionView.reloadData()
    }
    
    func showError(error: String) {
        print(error)
    }
    
    func showAlert(title : String, msg : String) {
        Alert.show(title, massege: msg, context: self)
    }
    
    
    func navigateToSubCategories(categories: Categories, index: Int) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SubCategoriesViewController") as! SubCategoriesViewController
        vc.idCategory = categories.catrgories?[index].id
        vc.titleCategory = categories.catrgories?[index].name
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
    
    
}
