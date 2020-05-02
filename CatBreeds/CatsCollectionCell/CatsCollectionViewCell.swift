//
//  CatsCollectionViewCell.swift
//  CatBreeds
//
//  Created by alexey sorochan on 02.05.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

protocol ZoomCatPhotoDelegate {
    func didLongPressCatPhoto(index: Int)
}

class CatsCollectionViewCell: UICollectionViewCell, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var catView: UIView!
    @IBOutlet weak var catBreedImageView: UIImageView!
    
    var delegate: ZoomCatPhotoDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tapGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.longPressTap(recognizer:)))
        tapGesture.delegate = self
        tapGesture.minimumPressDuration = 0.75
        catBreedImageView.isUserInteractionEnabled = true
        catBreedImageView.addGestureRecognizer(tapGesture)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        catBreedImageView.image = nil
    }
    
    @objc func longPressTap(recognizer: UILongPressGestureRecognizer) {

        delegate?.didLongPressCatPhoto(index: tag)
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
