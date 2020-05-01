
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
        
        
        tableView.register(UINib(nibName: "CatBreedTableViewCell", bundle: nil), forCellReuseIdentifier: "CatBreedTableViewCell")
        
        
    
    }
}


extension BreedListViewController: UITableViewDataSource, UITableViewDelegate {
  
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catBreeds.count
    }
      
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CatBreedTableViewCell", for: indexPath) as! CatBreedTableViewCell
        
        cell.updateCatBreedCell(breed: catBreeds[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if catBreeds.count < maxCount && indexPath.row >= catBreeds.count - 1 {
            pageNumber += 1
            isLoaded = false
        
            breedRequest()
            
        }
    }
      
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return UITableView.automaticDimension
    }
    
    
    
    
}
