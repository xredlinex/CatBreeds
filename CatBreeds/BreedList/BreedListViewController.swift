
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
    
    
    let apikey = "e69a263b-36bd-4d43-89d3-b77186c2138e"
    let link = "https://api.thecatapi.com/v1/breeds?"
    let imageSearchLink = "https://api.thecatapi.com/v1/images/search"
    let searchLink = "https://api.thecatapi.com/v1/breeds/search"
    var pageNumber = 0
    var pageSize = 10
    var maxCount = 100
    var isLoaded = true

    var catBreeds: [CatBreeds] = []

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
        
        if catBreeds.isEmpty {
            isLoaded = false
            makeRequest()
        }
        
        tableView.register(UINib(nibName: "CatBreedTableViewCell", bundle: nil), forCellReuseIdentifier: "CatBreedTableViewCell")
        tableView.addSubview(refreshControll)
        searchTextField.delegate = self
    }
    
    @IBAction func didTapSearchBreedActionButton(_ sender: Any) {
        showSearchFieldHeightContstraint.priority = UILayoutPriority(rawValue: 900)
    }
}

extension BreedListViewController: UITextFieldDelegate {
    
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.rangeOfCharacter(from: .letters) != nil || string == ""{
            return true
        }else {
//            show alert if  no letters
            return false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.resignFirstResponder()
        searchBreed()
        searchTextField.text = ""
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
           searchTextField.resignFirstResponder()
               }
}

extension BreedListViewController {
    
    func searchBreed() {
        if let key = searchTextField.text, key.count > 1 {
                        searchKeyword = key
            pageNumber = 0
            catBreeds.removeAll()
            tableView.reloadData()
            isLoaded = false
            isSearch = true
            makeRequest()
            
        } else {
//            show alert key emty
            debugPrint("key must be more than 2 characters")
        }
    }
}

extension BreedListViewController {
    
    func setupUI() {
        
        searchTextField.attributedPlaceholder = NSAttributedString(string: "search by breed",
                                                                   attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
    }
}
