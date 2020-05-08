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
    
    func didLongPressCatPhoto(index: Int) {
        
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
        breedTemperamentTextLabel.text = catBreed?.temperament ?? "--"
        breedOriginTextLabel.text = catBreed?.origin ?? "--"
        breedLifeSpanTextLabel.text = "\(catBreed?.lifeSpan ?? "--")  average years"
        breedDescriptionTextLabel.text = catBreed?.description ?? "--"
        
        if let altName = catBreed?.altName, altName != "" {
            breedAltNameTextLabel.text = altName
        } else {
            altView.isHidden = true
            bottomHeightConstraint.constant = -100
        }
        
        if !imperialWeight {
            breedWeightTextLabel.text = "\(catBreed?.weight?.metric ?? "--") kg"
        } else {
            breedWeightTextLabel.text = "\(catBreed?.weight?.imperial ?? "--") lb"
        }
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

extension BreedInfoViewController {
    
    func chageMetricWeight() {
        breedWeightTextLabel.text = !imperialWeight ? "\(catBreed?.weight?.imperial ?? "--") lb" : "\(catBreed?.weight?.metric ?? "--") kg"
        metricTextLabel.text = !imperialWeight ? "metric" : "imperial"
        imperialWeight = !imperialWeight
    }
}

extension BreedInfoViewController {
    
    func presentAlert(_ title: String,_ message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default) { (_) in }
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
}
