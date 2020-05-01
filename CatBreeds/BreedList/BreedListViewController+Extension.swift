//
//  BreedListViewController+Extension.swift
//  CatBreeds
//
//  Created by alexey sorochan on 30.04.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import Foundation
import UIKit


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
