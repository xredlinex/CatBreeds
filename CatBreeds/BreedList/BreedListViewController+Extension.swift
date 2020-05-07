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
    
    func loadRequeuest() {
        if catBreeds.isEmpty {
            isLoaded = false
            makeRequest()
        }
    }
}

extension BreedListViewController {
    
    func defaultParam() {
        pageNumber = 0
        isSearch = false
        catBreeds.removeAll()
        tableView.reloadData()
        makeRequest()
        showSearchFieldHeightContstraint.priority = UILayoutPriority(rawValue: 600)
    }
}

extension BreedListViewController {
    
    func searchBreed() {
        if let key = searchTextField.text, key.count > 2 {
            searchKeyword = key
            pageNumber = 0
            catBreeds.removeAll()
            isLoaded = false
            isSearch = true
            makeRequest()
        } else {
            presentErrorAlert("Sorry", errorAlert.errorKey(.moreTwoChar))
        }
    }
}

extension BreedListViewController {
    
    func refreshRequest() {
        refreshControll.attributedTitle = NSAttributedString(string: "updating cats", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        refreshControll.tintColor = .white
        refreshControll.addTarget(self, action: #selector(refreshData), for: UIControl.Event.valueChanged)
    }
    
    @objc func refreshData() {
        defaultParam()
        refreshControll.endRefreshing()
        showSearchFieldHeightContstraint.priority = UILayoutPriority(rawValue: 600)
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

extension BreedListViewController {
    
    func setupUI() {
        searchTextField.attributedPlaceholder = NSAttributedString(string: "    search by breed",
                                                                   attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
    }
}


extension BreedListViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.rangeOfCharacter(from: .letters) != nil || string == "" {
            return true
        } else {
            presentErrorAlert("Sorry", errorAlert.errorKey(.onlyLetters))
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
    
    func presentErrorAlert(_ title: String,_ message: String) {
        self.hideActivityIndicator()
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default) { (_) in}
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
}

