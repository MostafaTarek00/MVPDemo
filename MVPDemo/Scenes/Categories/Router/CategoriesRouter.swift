//
//  CategoriesRouter.swift
//  ViperDemo
//
//  Created by Mustafa on 3/14/20.
//  Copyright © 2020 Mostafa. All rights reserved.
//

import UIKit

class CategoriesRouter {
    
    class func createCategoriesVC() -> UIViewController  {
        let navigationController = mainStoryboard.instantiateViewController(identifier: "MainNavigationController")
        let categoriesView = navigationController.children.first as? CategoriesView
        let interactor = CategoriesInteractor()
        let router = CategoriesRouter()
        let presenter = CategoriesPresenter(view: categoriesView, interactor: interactor, router: router)
        categoriesView?.presenter = presenter
        return navigationController
    }
    
    class var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
