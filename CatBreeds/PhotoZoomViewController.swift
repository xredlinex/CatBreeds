//
//  PhotoZoomViewController.swift
//  CatBreeds
//
//  Created by alexey sorochan on 03.05.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

class PhotoZoomViewController: UIViewController {
    
    @IBOutlet weak var catView: UIView!
    @IBOutlet weak var zoomCatImageView: UIImageView!
    
    var imageUrl: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        zoomCatImageView.downloadImage(url: imageUrl ?? "")
    }

    @IBAction func didTapDoneButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
