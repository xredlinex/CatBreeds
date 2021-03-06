//
//  BreedListViewController+TableView.swift
//  CatBreeds
//
//  Created by alexey sorochan on 01.05.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

//MARK: - table view delegate -

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
        if catBreeds.count < maxCount && indexPath.row >= catBreeds.count - 1 && !isSearch {
            pageNumber += 1
            isLoaded = false
            makeRequest()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "BreedInfoViewController") as! BreedInfoViewController
        viewController.catBreed = catBreeds[indexPath.row]
        navigationController?.pushViewController(viewController, animated: true)
    }
}
