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
        breedDescriptionTextLabel.text = breed.description ?? ""
        catBreedImageView.downloadImage(url: breed.imageUrl ?? "" )
        
        catView.blurCell()
        catBreedView.clipsToBounds = true
        catBreedView.layer.cornerRadius =  catBreedView.frame.width / 2
        catBreedView.layer.borderColor = UIColor.systemGray.cgColor
        catBreedView.layer.borderWidth = 2
        catBreedImageView.contentMode = .scaleAspectFill
        
        

    }
}


extension UIView {
    
        func blurCell () {
        
     let view = self
        let blurEffect = UIBlurEffect(style: .systemThinMaterialDark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(blurView, at: 0)
        blurView.clipsToBounds = true
        blurView.layer.cornerRadius = 12.0
        NSLayoutConstraint.activate([blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
                                     blurView.widthAnchor.constraint(equalTo: view.widthAnchor)])
        
        
    }
}
