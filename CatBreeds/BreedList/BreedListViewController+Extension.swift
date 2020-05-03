//
//  BreedListViewController+Extension.swift
//  CatBreeds
//
//  Created by alexey sorochan on 30.04.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import Foundation
import UIKit

extension BreedListViewController {
    
    func refreshRequest() {
        refreshControll.attributedTitle = NSAttributedString(string: "updating cats", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        refreshControll.tintColor = .white
        refreshControll.addTarget(self, action: #selector(refreshData), for: UIControl.Event.valueChanged)
    }
    
    @objc func refreshData() {
        pageNumber = 0
        catBreeds.removeAll()
        tableView.reloadData()
//        breedRequest()
        makeRequest()
        refreshControll.endRefreshing()
    }
}
