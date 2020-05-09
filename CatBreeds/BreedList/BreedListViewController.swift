
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
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var showSearchFieldHeightContstraint: NSLayoutConstraint!
    @IBOutlet weak var searchButtonView: UIView!
    
    let apikey = "e69a263b-36bd-4d43-89d3-b77186c2138e"
    let link = "https://api.thecatapi.com/v1/breeds?"
    let imageSearchLink = "https://api.thecatapi.com/v1/images/search"
    let searchLink = "https://api.thecatapi.com/v1/breeds/search"
    var pageNumber = 0
    var pageSize = 10
    var maxCount = 100
    var isLoaded = true
    var catBreeds: [CatBreeds] = []
    let errorAlert = AlertErrors()
    var isSearch = false
    var searchKeyword: String?
    let refreshControll = UIRefreshControl()
    let activityIndicator = UIActivityIndicatorView()
    let viewForActivityIndicator = UIView()
    let dispatchGroup = DispatchGroup()
    let dispatchImageGroup = DispatchGroup()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupBackground()
        refreshRequest()
        loadRequeuest()
        
        tableView.register(UINib(nibName: "CatBreedTableViewCell", bundle: nil), forCellReuseIdentifier: "CatBreedTableViewCell")
        tableView.addSubview(refreshControll)
        searchTextField.delegate = self
    }
    
    @IBAction func didTapSearchBreedActionButton(_ sender: Any) {
        searchBreed()
    }
    
    @IBAction func didTapShowAllBreedsActionButton(_ sender: Any) {
        showAllBreedsAlert()
    }
    
    @IBAction func didTapShowSearchActionButton(_ sender: Any) {
        showSearchBar()
    }
}
