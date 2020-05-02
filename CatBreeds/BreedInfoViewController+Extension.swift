//
//  BreedInfoViewController+Extension.swift
//  CatBreeds
//
//  Created by alexey sorochan on 02.05.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import Foundation
import UIKit

extension BreedInfoViewController: ZoomCatPhotoDelegate {
    
    func didLongPressCatPhoto(index: Int, recognizer: UIPinchGestureRecognizer) {
        
        if let presnt = self.presentedViewController {
            presnt.removeFromParent()
        }
        
        let viewController  = storyboard?.instantiateViewController(withIdentifier: "PhotoZoomViewController") as! PhotoZoomViewController
        viewController.modalPresentationStyle = .popover
        let popOverViewController = viewController.popoverPresentationController
        popOverViewController?.delegate = self
        popOverViewController?.sourceView = self.collectionView
        popOverViewController?.presentationTransitionDidEnd(true)
        popOverViewController?.sourceRect = CGRect(x: self.collectionView.bounds.midX, y: self.collectionView.bounds.midY, width: 0, height: 0)
        viewController.preferredContentSize = CGSize(width: 350, height: 350)
        viewController.imageUrl = catsCollection[index].url
        self.present(viewController, animated: true)
    }
}

extension BreedInfoViewController: UIPopoverPresentationControllerDelegate {
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
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
        breedAltNameTextLabel.text = catBreed?.altName ?? "-----"
    }
}

extension BreedInfoViewController {
    
    func setupUI() {
        
        altView.infoBlurCell()
        originView.infoBlurCell()
        descriptionView.infoBlurCell()
        temperamentView.infoBlurCell()
        weightView.infoBlurCell()
        spanView.infoBlurCell()
    }
}
