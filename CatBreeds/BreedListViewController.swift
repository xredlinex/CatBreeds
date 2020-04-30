//
//  BreedListViewController.swift
//  CatBreeds
//
//  Created by alexey sorochan on 29.04.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

class BreedListViewController: UIViewController {
    
    
    let apikey = "e69a263b-36bd-4d43-89d3-b77186c2138e"
    var link = "https://api.thecatapi.com/v1/breeds?"
    
    var catBreeds: [CatBreeds] = []
    
    var pageNumber = 1
    var pageSize = 5
    var maxCount = 100
    var isLoaded = true
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if catBreeds.isEmpty {
            isLoaded = false
            breedRequest()
        }
    }
}

extension BreedListViewController {
    
    func breedRequest() {
        
        if !isLoaded {

            var urlComponents = URLComponents(string: link)
            
            urlComponents?.queryItems = [URLQueryItem(name: "page", value: "\(pageNumber)"),
                                         URLQueryItem(name: "limit", value: "\(pageSize)")]

            let url = urlComponents?.url
            
            if let urlCorrect = url {
                var urlRequest = URLRequest(url: urlCorrect)
                urlRequest.allHTTPHeaderFields = ["X-Api-Key" : apikey]
                urlRequest.httpMethod = "GET"
                debugPrint("start requsest")
                URLSession.shared.dataTask(with: urlRequest) {data, response, error in
                    
                
                    if let jsonData = data {
                        do {
                            let decodeBreeds = try JSONDecoder().decode([CatBreeds].self, from: jsonData)
                            self.catBreeds = decodeBreeds
                            
                         
                            DispatchQueue.main.async {
                                debugPrint("start decode")
                               for breeds in self.catBreeds {
                                                              
                                                              debugPrint(breeds.name, breeds.id)
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

