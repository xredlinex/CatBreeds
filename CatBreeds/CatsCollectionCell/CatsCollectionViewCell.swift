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
        
        gestureSetap()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        catBreedImageView.image = nil
    }
}
