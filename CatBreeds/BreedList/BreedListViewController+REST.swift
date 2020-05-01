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
                                    debugPrint("some start")
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
                                                            debugPrint("-----------------")
                                                            debugPrint(catUrl)
                                                            decodeBreeds[i].imageUrl = catUrl
                                                            
                                                            
                                                            
                                                            
                                                        }
                                                    } catch {
                                                        print(error)
                                                    }
                                                }
                                                
                                            }.resume()
                                        }
                                        
                                        
                                    } else {
                                        debugPrint("shit")
                                    }
                                }
                                
                                
                                
                                
                                
                                self.catBreeds.append(contentsOf: decodeBreeds)
                                
                                DispatchQueue.main.sync {
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    self.tableView.reloadData()
                                }
                            }
                            //                            self.catBreeds = decodeBreeds
                            //                            DispatchQueue.main.async {
                            //
                            //                                debugPrint("get image")
                            //                                                         for i in 0..<self.catBreeds.count {
                            //                                                             self.catBreeds[i].imageUrl = self.getCatImgUrl(breedId: self.catBreeds[i].id ?? "")
                            //                                                             debugPrint("--------------------")
                            //                                                                                         debugPrint(self.catBreeds[i].imageUrl ?? "0000")
                            //                                                             debugPrint("--------------------")
                            //
                            //                                                         }
                            ////                                self.tableView.reloadData()
                            //
                            //
                            //                            }
                            
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
        
        var catUrl: String = "no urlz"
        
        
        
        
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
                        
                        DispatchQueue.main.sync {
                            
                            
                            catUrl = decodeData[0].url ?? ""
                            debugPrint("url" + "----" + catUrl)
                        }
                    } catch {
                        print(error)
                    }
                }
                
            }.resume()
        }
        
        
        return catUrl
    }
}


