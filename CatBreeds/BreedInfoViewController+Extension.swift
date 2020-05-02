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

//
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let viewController = storyboard.instantiateViewController(withIdentifier: "PhotoZoomViewController") as! PhotoZoomViewController
//        navigationController?.popoverPresentationController?.delegate = implOfUIAPCDelegate
        
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let viewController = storyboard.instantiateViewController(withIdentifier: "PhotoZoomViewController") as! PhotoZoomViewController
//        viewController.modalPresentationStyle = .popover
////        let popover = viewController.popoverPresentationController
////        popover.barButtonItem = sender
//
//        navigationController?.popoverPresentationController = viewController
//        navigationController?.pushViewController(viewController, animated: true)
//
        
        
        
        let viewController  = storyboard?.instantiateViewController(withIdentifier: "PhotoZoomViewController") as! PhotoZoomViewController
        viewController.modalPresentationStyle = .popover
        let popOverViewController = viewController.popoverPresentationController
        popOverViewController?.delegate = self
        

//        var popoverContent = self.storyboard?.instantiateViewController(withIdentifier: "PhotoZoomViewController") as! PhotoZoomViewController
//            var nav = UINavigationController(rootViewController: popoverContent)
//            nav.modalPresentationStyle = UIModalPresentationStyle.Popover
//            var popover = nav.popoverPresentationController
//            popoverContent.preferredContentSize = CGSizeMake(500,600)
//            popover.delegate = self
//            popover.sourceView = self.view
//            popover.sourceRect = CGRectMake(100,100,0,0)
//
//            self.presentViewController(nav, animated: true, completion: nil)
    
//        switch recognizer.state {
//        case .began:
//               debugPrint("begin")
//            UIView.animate(withDuration: 0.05) {
//
//                self.view.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
//            }
//        case .ended:
//            debugPrint("end")
//            UIView.animate(withDuration: 0.05) {
//                self.view.transform = CGAffineTransform.identity
//            }
//        default:
//            break
//        }

        
    }
}


extension BreedInfoViewController: UIPopoverPresentationControllerDelegate {
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
}
