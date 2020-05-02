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
    
    
    
    
    
    var catBreed: CatBreeds?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateBreedInfo()

        
    }

}


extension BreedInfoViewController {
    
    func updateBreedInfo() {
        
        

        breedNameTextLabel.text = catBreed?.name ?? "--"
        breedWeightTextLabel.text = catBreed?.weight?.metric  ?? "--"
        breedTemperamentTextLabel.text = catBreed?.temperament ?? "--"
        breedOriginTextLabel.text = catBreed?.origin ?? "--"
        breedLifeSpanTextLabel.text = catBreed?.lifeSpan ?? "--"
        breedDescriptionTextLabel.text = catBreed?.description ?? "--"
        breedAltNameTextLabel.text = catBreed?.altName ?? "--"

        debugPrint(catBreed?.name)
        debugPrint(catBreed?.weight?.metric)
        debugPrint(catBreed?.temperament)
        debugPrint(catBreed?.origin)
        debugPrint(catBreed?.lifeSpan)
        debugPrint(catBreed?.description)
        debugPrint(catBreed?.altName ?? "0000")
        debugPrint(catBreed?.imageUrl)
    }
}
