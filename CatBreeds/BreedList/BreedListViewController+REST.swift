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
                debugPrint("reload data")
                self.tableView.reloadData()
            }
        }
    }
}

extension BreedListViewController {
    
    func makeBreedRequest() {
    
        let url: URL?
       
        if !isSearch {
            var urlComponents = URLComponents(string: link)
            urlComponents?.queryItems = [URLQueryItem(name: "page", value: "\(pageNumber)"),
            URLQueryItem(name: "limit", value: "\(pageSize)")]
            url = urlComponents?.url
        } else {
            var urlComponents = URLComponents(string: searchLink)
            urlComponents?.queryItems = [URLQueryItem(name: "q", value: searchKeyword)]
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
                            debugPrint(self.catBreeds.count)
                            DispatchQueue.main.async {
                                self.hideActivityIndicator()                               
                            }
                        } else {
                            debugPrint("stop")
                            if self.catBreeds.count == 0 {
                                debugPrint("no cats")
                            } else {
                                self.errorAlertNotofication()
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
        debugPrint("make image request")
        for i in 0..<catBreeds.count {
            debugPrint("i")
            dispatchImageGroup.enter()
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
                                        self.dispatchImageGroup.leave()
                                        debugPrint("leave")
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
        dispatchImageGroup.notify(queue: DispatchQueue.main) {
            debugPrint("reload pleeeeese")
            self.tableView.reloadData()
        }
    }
}
