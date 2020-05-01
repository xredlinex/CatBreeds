//
//  BreedListViewController+REST.swift
//  CatBreeds
//
//  Created by alexey sorochan on 30.04.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import Foundation

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
                URLSession.shared.dataTask(with: urlRequest) {data, response, error in
                    if let jsonData = data {
                        do {
                            let decodeBreeds = try JSONDecoder().decode([CatBreeds].self, from: jsonData)
                            if decodeBreeds.count != 0 {
                                for i in 0..<decodeBreeds.count {
                                    if decodeBreeds[i].imageUrl != "" {
                                        var urlComponents = URLComponents(string: self.imageSearchLink)
                                        urlComponents?.queryItems = [URLQueryItem(name: "breed_id", value: decodeBreeds[i].id)]
                                        let url = urlComponents?.url
                                        if let urlCorrect = url {
                                            var urlRequest = URLRequest(url: urlCorrect)
                                            urlRequest.allHTTPHeaderFields = ["X-Api-Key" : self.apikey]
                                            urlRequest.httpMethod = "GET"
                                            URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                                                if let jsonData = data {
                                                    do {
                                                        let decodeData = try JSONDecoder().decode([CatUrlImage].self, from: jsonData)
                                                        if let catUrl = decodeData[0].url {
                                                            decodeBreeds[i].imageUrl = catUrl
                                                            
                                                        }
                                                    } catch {
                                                        print(error)
                                                    }
                                                }
                                            }.resume()
                                        }
                                    } else {
                                    }
                                }
                                self.catBreeds.append(contentsOf: decodeBreeds)
                                
                                DispatchQueue.main.sync {
                                    
                                    
                                    self.tableView.reloadData()
                                    debugPrint("table view reload")
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




