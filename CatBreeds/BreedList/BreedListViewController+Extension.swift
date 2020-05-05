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
        makeRequest()
        refreshControll.endRefreshing()
    }
}

extension BreedListViewController {
    
    func showActivityIndicator() {
        
        let blurView = UIVisualEffectView()
        let indicatorTextLabel = UILabel()
        
        indicatorTextLabel.frame = CGRect(x: 50, y: 0, width: 160, height: 45)
        indicatorTextLabel.text = "loading cats"
        indicatorTextLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        
        blurView.effect = UIBlurEffect(style: .systemThickMaterial)
        blurView.clipsToBounds = true
        blurView.layer.masksToBounds = true
        blurView.layer.cornerRadius = 12.0
        blurView.translatesAutoresizingMaskIntoConstraints = false
        viewForActivityIndicator.insertSubview(blurView, at: 0)
        
        NSLayoutConstraint.activate([blurView.heightAnchor.constraint(equalTo: viewForActivityIndicator.heightAnchor),
                                            blurView.widthAnchor.constraint(equalTo: viewForActivityIndicator.widthAnchor)])
        
        viewForActivityIndicator.layer.cornerRadius = 12
        viewForActivityIndicator.clipsToBounds = true
        viewForActivityIndicator.frame = CGRect(x: view.frame.midX - indicatorTextLabel.frame.width / 2,
                                                y: view.frame.midY - indicatorTextLabel.frame.height / 2, width: 160, height: 45)
        activityIndicator.style = .medium
        activityIndicator.color = .black
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 45, height: 45)
        activityIndicator.startAnimating()
        
        viewForActivityIndicator.addSubview(indicatorTextLabel)
        viewForActivityIndicator.addSubview(activityIndicator)
        
        view.addSubview(viewForActivityIndicator)
    }
    
    func hideActivityIndicator() {
        activityIndicator.stopAnimating()
        viewForActivityIndicator.removeFromSuperview()
    }
}
