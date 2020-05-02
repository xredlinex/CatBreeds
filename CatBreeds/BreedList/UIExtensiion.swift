//
//  Extensiion.swift
//  CatBreeds
//
//  Created by alexey sorochan on 02.05.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit


extension UIViewController {

     func setupBackground() {

        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        let backgroundForImage = UIView(frame: UIScreen.main.bounds)
        let blackBackground = UIView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "backgroundIos")
        backgroundImage.contentMode = .scaleAspectFill
        backgroundForImage.backgroundColor = .gray
        backgroundForImage.alpha = 0.3
        blackBackground.backgroundColor = .black
        blackBackground.alpha = 0.4
        view.addSubview(blackBackground)
        view.addSubview(backgroundImage)
        view.addSubview(backgroundForImage)
        view.sendSubviewToBack(blackBackground)
        view.sendSubviewToBack(backgroundForImage)
        view.sendSubviewToBack(backgroundImage)
    }
}
