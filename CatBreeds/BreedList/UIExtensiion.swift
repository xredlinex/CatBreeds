//
//  Extensiion.swift
//  CatBreeds
//
//  Created by alexey sorochan on 02.05.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

//MARK: -  ui setup for background view controllers -

extension UIViewController {
    
    func setupBackground() {
        let colorOne = UIColor(red: 124/255, green: 59/255, blue: 68/255, alpha: 1)
        let colotTwo = UIColor(red: 112/255, green: 56/255, blue: 104/255, alpha: 1)
        view.setupBackgroundGradient([colotTwo.cgColor, colorOne.cgColor])
    }
}

