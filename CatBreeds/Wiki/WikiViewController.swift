//
//  WikiViewController.swift
//  CatBreeds
//
//  Created by alexey sorochan on 03.05.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit
import WebKit

class WikiViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    var url: URL?
    let activityIndicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupBackground()
        setupForActivityIndicator()
        
        if let ulrCorrect = url {
            let urlRequest = URLRequest(url: ulrCorrect)
            webView.load(urlRequest)
        }
        webView.navigationDelegate = self
    }
    
    @IBAction func didTapBackActionButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
