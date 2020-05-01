//
//  CatBreedTableViewCell.swift
//  CatBreeds
//
//  Created by alexey sorochan on 30.04.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

class CatBreedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var catBreedView: UIView!
    @IBOutlet weak var catBreedImageView: UIImageView!
    @IBOutlet weak var breedNameTextLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        catBreedImageView.image = nil
    }
    
    
    func updateCatBreedCell(breed: CatBreeds) {
        breedNameTextLabel.text = breed.name ?? ""
        catBreedImageView.downloadImage(url: breed.imageUrl ?? "" )
    }
}

