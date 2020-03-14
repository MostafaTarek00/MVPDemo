//
//  CategoriesInteractor.swift
//  MVPDemo
//
//  Created by Mustafa on 3/7/20.
//  Copyright © 2020 Mostafa. All rights reserved.
//

import Foundation
import Alamofire

class CategoriesInteractor {
    
    
    
    // MARK: - All Categories

     func getAllCategories( callback: @escaping (Categories) -> Void, failureHandler: @escaping (Error) -> Void) {
        let url = URLs.getAllCategories
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.get, parameters: nil, headers:nil, callBack: { (response: Categories) in
            callback(response)
        }) { (error) in
            failureHandler(error)
        }
    }
   
}
