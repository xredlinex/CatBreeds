//
//  BreedInfoViewController.swift
//  CatBreeds
//
//  Created by alexey sorochan on 02.05.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import Foundation
import UIKit

class BreedInfoViewController: UIViewController {
    
    @IBOutlet weak var breedNameTextLabel: UILabel!
    @IBOutlet weak var breedWeightTextLabel: UILabel!
    @IBOutlet weak var breedTemperamentTextLabel: UILabel!
    @IBOutlet weak var breedOriginTextLabel: UILabel!
    @IBOutlet weak var breedLifeSpanTextLabel: UILabel!
    @IBOutlet weak var breedDescriptionTextLabel: UILabel!
    @IBOutlet weak var breedAltNameTextLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var altView: UIView!
    @IBOutlet weak var originView: UIView!
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var temperamentView: UIView!
    @IBOutlet weak var weightView: UIView!
    @IBOutlet weak var spanView: UIView!
    @IBOutlet weak var bottomHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var hideCollectionHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var metricTextLabel: UILabel!
    
    var catBreed: CatBreeds?
    var catsCollection: [CatUrlImage] = []
    let imageSearchLink = "https://api.thecatapi.com/v1/images/search"
    let apikey = "e69a263b-36bd-4d43-89d3-b77186c2138e"
    var pageNumber = 0
    var pageSize = 100
    var maxCount = 100
    var isLoaded = true
    var imperialWeight = false
    let errorAlert = AlertErrors()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
        setupUI()
        updateBreedInfo()
        isLoaded = false
        getCatImagesCollection(breedId: catBreed?.id ?? "")
        collectionView.register(UINib(nibName: "CatsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CatsCollectionViewCell")
    }
    
    @IBAction func didTapGoBackButton(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
    
    @IBAction func didTapChengeWeightActionButton(_ sender: Any) {
        chageMetricWeight()
    }
    
    @IBAction func didTapWikipediaActionButton(_ sender: Any) {
        if let url = catBreed?.wikiUrl {
            let viewController = storyboard?.instantiateViewController(withIdentifier: "WikiViewController") as! WikiViewController
            viewController.url = URL(string: url)
            navigationController?.pushViewController(viewController, animated: true)
        } else {
            presentAlert("Sorry", errorAlert.errorKey(.noWiki))
        }
    }
}
