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
                            self.catBreeds = decodeBreeds
                            DispatchQueue.main.async {
                                for breeds in self.catBreeds {
                                    breeds.imageUrl = self.getCatImgUrl(breedId: breeds.id ?? "")
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

extension BreedListViewController {
    
    func getCatImgUrl(breedId: String) -> (String) {
        
        var catUrl: String?
        
        var urlComponents = URLComponents(string: imageSearchLink)
        urlComponents?.queryItems = [URLQueryItem(name: "breed_id", value: breedId)]
        let url = urlComponents?.url
        
        if let urlCorrect = url {
            var urlRequest = URLRequest(url: urlCorrect)
            urlRequest.allHTTPHeaderFields = ["X-Api-Key" : apikey]
            urlRequest.httpMethod = "GET"
            URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                
                if let jsonData = data {
                    do {
                        let decodeData = try JSONDecoder().decode([CatUrlImage].self, from: jsonData)
                        DispatchQueue.main.async {
                            catUrl = decodeData[0].url
                        }
                    } catch {
                        print(error)
                    }
                }
            }.resume()
        }
        return catUrl ?? ""
    }
}

