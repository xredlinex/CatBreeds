//
//  BreedListViewController+REST.swift
//  CatBreeds
//
//  Created by alexey sorochan on 30.04.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import Foundation

extension BreedListViewController {
    
    func makeRequest() {
        
        if !isLoaded && pageNumber < 10 {
            showActivityIndicator()
            makeBreedRequest()
            dispatchGroup.notify(queue: DispatchQueue.main) {
                self.makeImageRequest()
                debugPrint("table view reload data")
                self.tableView.reloadData()
                self.hideActivityIndicator()
//                DispatchQueue.main.async {
////                    debugPrint("reload talbe view")
////                    self.hideActivityIndicator()
//                    debugPrint("new reload data ")
//                    self.tableView.reloadData()
//                    self.hideActivityIndicator()
////
//                }
            }
        }
    }
}

extension BreedListViewController {
    
    func makeBreedRequest() {
        

        let url: URL?
       
        
        
        if !search {
                    var urlComponents = URLComponents(string: link)
            urlComponents?.queryItems = [URLQueryItem(name: "page", value: "\(pageNumber)"),
            URLQueryItem(name: "limit", value: "\(pageSize)")]
            url = urlComponents?.url
        } else {
            
            var urlComponents = URLComponents(string: searchLink)
            urlComponents?.queryItems = [URLQueryItem(name: "q", value: "bi")]
            url = urlComponents?.url
        }
        
        if let urlCorrect = url {
            
            var urlRequest = URLRequest(url: urlCorrect)
            urlRequest.allHTTPHeaderFields = ["X-Api-Key" : apikey]
            urlRequest.httpMethod = "GET"
            
            dispatchGroup.enter()
            URLSession.shared.dataTask(with: urlRequest) {data, respnse, error in
                
                if let jsonData = data {
                    do {
                        let deocdeBreeds = try JSONDecoder().decode([CatBreeds].self, from: jsonData)
                        if deocdeBreeds.count != 0 {
                            self.catBreeds.append(contentsOf: deocdeBreeds)
                            
                        } else {
                            debugPrint("stop")
                            if self.catBreeds.count == 0 {
                                debugPrint("no cats")
                            } else {
//                                self.hideActivityIndicator()
                                debugPrint("all cats")
                            }
                        }
                    } catch {
                        print(error)
                    }
                    self.dispatchGroup.leave()
                }
            }.resume()
        }
    }
    
    func makeImageRequest() {
       
        for i in 0..<catBreeds.count {
            if let id = catBreeds[i].id, id != "" {
                if catBreeds[i].imageUrl == nil {
                    var urlComponents = URLComponents(string: imageSearchLink)
                    urlComponents?.queryItems = [URLQueryItem(name: "breed_id", value: id),
                                                 URLQueryItem(name: "size", value: "thumb"),
                                                 URLQueryItem(name: "limit", value: "1")]
                    let url = urlComponents?.url
                    if let urlCorrect = url {
                        var urlRequest = URLRequest(url: urlCorrect)
                        urlRequest.allHTTPHeaderFields = ["X-Api-Key" : apikey]
                        urlRequest.httpMethod = "GET"
                        
                        URLSession.shared.dataTask(with: urlRequest) {data, response, error in
                            if let jsonData = data {
                                do {
                                    let decodeData = try JSONDecoder().decode([CatUrlImage].self, from: jsonData)
                                    if let catUrl = decodeData[0].url {
                                        self.catBreeds[i].imageUrl = catUrl
                                        debugPrint(catUrl)
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
    }
}



