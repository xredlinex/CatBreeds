//
//  CatsCollectionViewCell.swift
//  CatBreeds
//
//  Created by alexey sorochan on 02.05.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

class CatsCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var catView: UIView!
    @IBOutlet weak var catBreedImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        catBreedImageView.image = nil
    }

}


extension CatsCollectionViewCell {
    
    func updateImageCell(imageUrl: String) {
        
        catBreedImageView.downloadImage(url: imageUrl)
        catBreedImageView.contentMode = .scaleAspectFill
        
        catView.clipsToBounds = true
        catView.layer.cornerRadius = 12.0
    }
}
