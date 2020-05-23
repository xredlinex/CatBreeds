//
//  UIView+Extension.swift
//  CatBreeds
//
//  Created by alexey sorochan on 01.05.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

//MARK: -  ui setup for info cells -

extension UIView {
    
    func infoBlurCell() {
        
        let blurEffect = UIBlurEffect(style: .systemMaterialDark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        blurView.layer.cornerRadius = 6
        blurView.clipsToBounds = true
        self.insertSubview(blurView, at: 0)
        self.clipsToBounds = true
        self.layer.cornerRadius = 6
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 7, height: 7)
        self.layer.shadowRadius = 5
        self.isOpaque = true
        NSLayoutConstraint.activate([blurView.heightAnchor.constraint(equalTo: self.heightAnchor),
                                     blurView.widthAnchor.constraint(equalTo: self.widthAnchor)])
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

extension UIView {
    
    func setupBackgroundGradient(_ colors: [CGColor]) {
        
        let gradient = CAGradientLayer()
        gradient.colors = colors
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0.3, y: 0.9)
        gradient.endPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.frame = self.layer.frame
        self.layer.insertSublayer(gradient, at: 0)
    }
}
