//
//  CatsCollectionViewCell+Extension.swift
//  CatBreeds
//
//  Created by alexey sorochan on 05.05.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

extension CatsCollectionViewCell {
    
    func updateImageCell(imageUrl: String) {
        
        catBreedImageView.downloadImage(url: imageUrl)
        catBreedImageView.contentMode = .scaleAspectFill
        
        catView.clipsToBounds = true
        catView.layer.cornerRadius = 12.0
    }
}

extension CatsCollectionViewCell {
    
    func gestureSetap() {
        
        let tapGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.longPressTap(recognizer:)))
        tapGesture.delegate = self
        tapGesture.minimumPressDuration = 0.75
        catBreedImageView.isUserInteractionEnabled = true
        catBreedImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc func longPressTap(recognizer: UILongPressGestureRecognizer) {
        delegate?.didLongPressCatPhoto(index: tag)
    }
}
