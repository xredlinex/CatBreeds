
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
    var link = "https://api.thecatapi.com/v1/breeds?"
    var imageSearchLink = "https://api.thecatapi.com/v1/images/search"
    
    var catBreeds: [CatBreeds] = []
    
    var pageNumber = 1
    var pageSize = 5
    var maxCount = 100
    var isLoaded = true
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        if catBreeds.isEmpty {
            isLoaded = false
            breedRequest()
        }
        
        
        
        
        
    }
}
