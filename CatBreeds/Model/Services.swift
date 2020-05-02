//
//  Services.swift
//  CatBreeds
//
//  Created by alexey sorochan on 29.04.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import Foundation
import UIKit


extension UIImageView {
    func downloadImage(url: String) {
        let imageUrl = URL(string: url)
        if let url = imageUrl {
            let urlRequest = URLRequest(url: url)
            URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                if error != nil {
                    print(error ?? "some error")
                    return
                }
                if let image = data {
                    DispatchQueue.main.async {
                        self.image = UIImage(data: image)
                    }
                }
            }.resume()
        }
    }
}

