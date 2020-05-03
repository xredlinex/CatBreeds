//
//  BreedListViewController+REST.swift
//  CatBreeds
//
//  Created by alexey sorochan on 30.04.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import Foundation

extension BreedListViewController {
    
    func makeRequestffff() {
        
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
                                        urlComponents?.queryItems = [URLQueryItem(name: "breed_id", value: decodeBreeds[i].id),
                                                                     URLQueryItem(name: "size", value: "thumb")]
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

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//extension BreedListViewController {
//
//    func make() {
//
//
//        var urlBreedComponents = URLComponents(string: link)
//        urlBreedComponents?.queryItems = [URLQueryItem(name: "page", value: "\(pageNumber)"),
//                                          URLQueryItem(name: "limit", value: "\(pageSize)")]
//
//        let url = urlBreedComponents?.url
//        if let urlCorrect = url {
//
//            var urlRequest = URLRequest(url: urlCorrect)
//            urlRequest.allHTTPHeaderFields = ["X-Api-Key" : apikey]
//            urlRequest.httpMethod = "GET"
//
//            URLSession.shared.dataTask(with: urlRequest) {data, respnse, error in
//
//                if let jsonData = data {
//                    do {
//                        let deocdeBreeds = try JSONDecoder().decode([CatBreeds].self, from: jsonData)
//                        if deocdeBreeds.count != 0 {
//                            self.catBreeds.append(contentsOf: deocdeBreeds)
//                        }
//                    } catch {
//                        print(error)
//                    }
//                }
//            }.resume()
//        }
//
//
//
//
//        var urlBreedImagesComponents = URLComponents(string: imageSearchLink)
//        urlBreedImagesComponents?.queryItems = [URLQueryItem(name: "breed_id", value: "RESULT OF !ST REQ"),
//                                                URLQueryItem(name: "size", value: "thumb")]
//
//
//        let imageUrl = urlBreedImagesComponents?.url
//        if let urlCorrect = imageUrl {
//
//            var urlRequest = URLRequest(url: urlCorrect)
//            urlRequest.allHTTPHeaderFields = ["X-Api-Key" : apikey]
//            urlRequest.httpMethod = "GET"
//
//            URLSession.shared.dataTask(with: urlRequest) {data, response, error in
//
//                if let jsonData = data {
//                    do {
//                        let decodeData = try JSONDecoder().decode([CatUrlImage].self, from: jsonData)
//                        if let catUrl = decodeData[0].url {
//
//                            debugPrint(catUrl)
//                        }
//                    } catch {
//                        print(error)
//                    }
//                }
//            }.resume()
//        }
//
//    }
//}


extension BreedListViewController {
    
    func zzz() {
        
        let radQueue = OperationQueue()
        
        
        
        
        
        let operationRequestOne = BlockOperation {
            
            
            
            
            debugPrint("operation One")
            self.makeBreedRequest()
        }
        let operationRequstTwo = BlockOperation {
            debugPrint("operation two")
            self.makeImageRequest()
        }
        let operationReload = BlockOperation {
            debugPrint("reaload table view")
            DispatchQueue.main.sync {
                self.tableView.reloadData()
            }
            
            
            for i in self.catBreeds {
                debugPrint(i.name ?? "--")
                debugPrint(i.imageUrl ?? "---")
            }
        }
        
        operationRequstTwo.addDependency(operationRequestOne)
        
        radQueue.addOperation(operationRequestOne)
        radQueue.addOperation(operationRequstTwo)
        radQueue.addOperation(operationReload)
        
        
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    
    func makeBreedRequest() {
//        debugPrint("start request")
        
        
        
        
            
            var urlComponents = URLComponents(string: link)
            urlComponents?.queryItems = [URLQueryItem(name: "page", value: "\(pageNumber)"),
                                         URLQueryItem(name: "limit", value: "\(pageSize)")]
            let url = urlComponents?.url
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
//                                debugPrint("add requst of cats")
                                
                                
                                
                                for i in self.catBreeds {
//                                    debugPrint(i.name)
                                    
                                    DispatchQueue.main.sync {
                                                                            }
                                    
                                    
                                }
                            }
//                            self.makeImageRequest()

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
                                    debugPrint("download image")
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



extension BreedListViewController {
    
    func makeRequest() {
        
        
        
        
        if !isLoaded {
        
        
        
        
//
//        let dispatchGroup = DispatchGroup()
//        dispatchGroup.enter()
        makeBreedRequest()
        
        
        
        dispatchGroup.notify(queue: DispatchQueue.main) {
            
      
          
            self.makeImageRequest()
            
            
            DispatchQueue.main.async {
                                                  self.tableView.reloadData()
                                              }
          
        }
        
    }
    }
}
