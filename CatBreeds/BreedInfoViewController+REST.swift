//
//  BreedInfoViewController+Rest.swift
//  CatBreeds
//
//  Created by alexey sorochan on 02.05.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

//MARK: - request load images by image id - 

extension BreedInfoViewController {
    
    func getCatImagesCollection(breedId: String) {
        
        if !isLoaded {
            var urlComponents = URLComponents(string: imageSearchLink)
            urlComponents?.queryItems = [URLQueryItem(name: "page", value: "\(pageNumber)"),
                                         URLQueryItem(name: "limit", value: "\(pageSize)"),
                                         URLQueryItem(name: "size", value: "small"),
                                         URLQueryItem(name: "breed_id", value: breedId)]
            let url = urlComponents?.url
            if let urlCorrect = url {
                var urlRequest = URLRequest(url: urlCorrect)
                urlRequest.allHTTPHeaderFields = ["X-Api-Key" : apikey]
                urlRequest.httpMethod = "GET"
                URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                    if let jsonData = data {
                        do {
                            let decodeData = try JSONDecoder().decode([CatUrlImage].self, from: jsonData)
                            if decodeData.count != 0 {
                                self.catsCollection.append(contentsOf: decodeData)
                                DispatchQueue.main.sync {
                                    self.collectionView.reloadData()
                                }
                            } else {
                                DispatchQueue.main.async {
                                    self.hideCollectionHeightConstraint.priority = UILayoutPriority(rawValue: 600)
                                }
                            }
                        } catch {
                            print(error)
                        }
                    }
                }.resume()
            }
        }
    }
}
