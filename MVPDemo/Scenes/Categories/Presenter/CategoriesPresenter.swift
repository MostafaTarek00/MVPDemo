//
//  CategoriesPresenter.swift
//  MVPDemo
//
//  Created by Mustafa on 3/8/20.
//  Copyright © 2020 Mostafa. All rights reserved.
//

import Foundation

protocol CategoriesView : class {
    func showIndicator()
    func hideIndicator()
    func fetchingDataSuccess()
    func showError(error: String)
    func showAlert(title : String, msg : String)
    func navigateToSubCategories(categories : Categories , index: Int)


}

protocol CategoriesCellView {
    func displayImage(image : String)
    func displayName(name : String)
}

class CategoriesPresenter {
    private weak var view : CategoriesView?
    private  let interactor = CategoriesInteractor()
    private var categories : Categories?
    
    init(view : CategoriesView ) {
        self.view = view
    }
    
    func viewDidLoad()  {
        getAllCategories()
    }
    
   //MARK: - Func to Get All Categories
      
      func getAllCategories()  {
        view?.showIndicator()
          interactor.getAllCategories(callback: { [weak self] (result) in
            guard let self = self else {return}
            self.view?.hideIndicator()
              print(result)
              switch result.status {
              case 1:
                self.categories = result
                self.view?.fetchingDataSuccess()
              case 2:
                self.view?.showAlert(title: "Error", msg: result.message!)
              default:
                  print(result.status)
              }
          }) { (error) in
            self.view?.showError(error: error.localizedDescription)
          }
      }
    
    func getCategoriesCount() -> Int {
        return categories?.catrgories?.count ?? 0
    }
    
    func configure(cell : CategoriesCellView, for  index : Int)  {
        let cat = categories?.catrgories?[index]
        cell.displayName(name: cat!.name)
        cell.displayImage(image: cat!.image)
    }
    
    func didSelectRow(index: Int) {
        view?.navigateToSubCategories(categories: categories!, index: index)
    }
}
