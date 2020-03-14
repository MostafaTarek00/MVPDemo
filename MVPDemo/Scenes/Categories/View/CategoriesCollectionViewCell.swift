//
//  CategoriesCollectionViewCell.swift
//  
//
//  Created by Mustafa on 3/7/20.
//

import UIKit
import SDWebImage

class CategoriesCollectionViewCell: UICollectionViewCell, CategoriesCellView {
    
    
    //MARK: - IBOutlet
    
    @IBOutlet weak var categoriesImage: UIImageView!
    @IBOutlet weak var categoriesName: UILabel!
    
    func displayImage(image: String) {
        categoriesImage.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: "appIcon1"))
    }
    
    func displayName(name: String) {
        categoriesName.text = name
    }
}
