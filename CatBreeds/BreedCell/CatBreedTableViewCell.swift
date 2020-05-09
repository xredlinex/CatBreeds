//
//  CatBreedTableViewCell.swift
//  CatBreeds
//
//  Created by alexey sorochan on 30.04.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

class CatBreedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var catView: UIView!
    @IBOutlet weak var catBreedView: UIView!
    @IBOutlet weak var catBreedImageView: UIImageView!
    @IBOutlet weak var breedNameTextLabel: UILabel!
    @IBOutlet weak var breedDescriptionTextLabel: UILabel!
    @IBOutlet weak var catOriginTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        catBreedImageView.image = nil
    }
}

extension CatBreedTableViewCell {
    
    func updateCatBreedCell(breed: CatBreeds) {
        breedNameTextLabel.text = breed.name ?? ""
        breedDescriptionTextLabel.text = breed.description ?? ""

        if let catImage = breed.imageUrl {
            catBreedImageView.downloadImage(url: catImage)
            
        } else {
            catBreedImageView.image = UIImage(named: "noImage")
            catBreedView.layer.backgroundColor = UIColor.lightGray.cgColor
        }

        catOriginTextLabel.text = breed.origin ?? "--"
        catView.blurCell()
        catBreedView.clipsToBounds = true
        catBreedView.layer.cornerRadius =  catBreedView.frame.width / 2
        catBreedView.layer.borderColor = UIColor.systemGray.cgColor
        catBreedView.layer.borderWidth = 2
        catBreedImageView.contentMode = .scaleAspectFill
    }
}
