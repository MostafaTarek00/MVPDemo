//
//  SubCategoriesViewController.swift
//  
//
//  Created by Mustafa on 3/7/20.
//

import UIKit

class SubCategoriesViewController: UIViewController {
    
    //MARK: - Variables
    
    var idCategory : String?
    var titleCategory : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDesign()
        // Do any additional setup after loading the view.
    }
    
    
    //MARK: - Func to Update Design
    
    func updateDesign()  {
        if let titleCategory = titleCategory {
            title =  titleCategory
        }
    }
    
}
