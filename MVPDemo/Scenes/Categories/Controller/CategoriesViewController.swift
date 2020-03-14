//
//  CategoriesViewController.swift
//  
//
//  Created by Mustafa on 3/7/20.
//

import UIKit

class CategoriesViewController: UIViewController {

    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    
    var presenter : CategoriesPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        presenter = CategoriesPresenter(view: self)
        presenter?.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}
