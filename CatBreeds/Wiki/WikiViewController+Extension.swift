//
//  WikiViewController+Extension.swift
//  CatBreeds
//
//  Created by alexey sorochan on 08.05.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit
import WebKit

extension WikiViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activityIndicator.startAnimating()
     }
     
     func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
     }
}

extension WikiViewController {
    
    func setupForActivityIndicator() {
        activityIndicator.style = .medium
        activityIndicator.color = .systemPurple
        activityIndicator.center = self.view.center
        view.addSubview(activityIndicator)
    }
}
