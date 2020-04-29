//
//  BreedListViewController.swift
//  CatBreeds
//
//  Created by alexey sorochan on 29.04.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

class BreedListViewController: UIViewController {
    
    let apikey = "e69a263b-36bd-4d43-89d3-b77186c2138e"
    var parameters: [String: Any] = [:]
    
    var pageSize = 10
    var pageNumber = 1
    var maxCount = 100
    var isLoaded = true
    

    override func viewDidLoad() {
        super.viewDidLoad()

  
    }

}



