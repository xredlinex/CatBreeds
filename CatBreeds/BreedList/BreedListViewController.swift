
//
//  BreedListViewController.swift
//  CatBreeds
//
//  Created by alexey sorochan on 29.04.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

class BreedListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let dispatchGroup = DispatchGroup()
    let apikey = "e69a263b-36bd-4d43-89d3-b77186c2138e"
    let link = "https://api.thecatapi.com/v1/breeds?"
    let imageSearchLink = "https://api.thecatapi.com/v1/images/search"
    let searchLink = "https://api.thecatapi.com/v1/breeds/search"
    var search = true
    var catBreeds: [CatBreeds] = []
    var pageNumber = 0
    var pageSize = 10
    var maxCount = 100
    var isLoaded = true
    let refreshControll = UIRefreshControl()
    let activityIndicator = UIActivityIndicatorView()
    let viewForActivityIndicator = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
        refreshRequest()
        
        if catBreeds.isEmpty {
            isLoaded = false
            makeRequest()
        }
        
        tableView.register(UINib(nibName: "CatBreedTableViewCell", bundle: nil), forCellReuseIdentifier: "CatBreedTableViewCell")
        tableView.addSubview(refreshControll)        
    }
    
    @IBAction func didTapSearchBreedActionButton(_ sender: Any) {
    }
}

