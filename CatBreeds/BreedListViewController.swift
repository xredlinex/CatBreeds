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
//    var parameters: [String: Any] = [:]
    
    
    var catBreeds: [CatBreeds] = []
    
    var pageSize = 10
    var pageNumber = 1
    var maxCount = 100
    var isLoaded = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        debugPrint("sssstart")
        breedRequest()
//        getBreed()
    }
}

extension BreedListViewController {
    
    func breedRequest() {
        
        if !isLoaded {
            
            let url = URL(string: link)
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

//
//
//extension BreedListViewController {
//    func getBreed() {
//        let url = URL(string: "https://api.thecatapi.com/v1/breeds?X-Api-Key=?e69a263b-36bd-4d43-89d3-b77186c2138e")
//        let deoceder = JSONDecoder()
//
//        if let url = url {
//            var urlRequest = URLRequest(url: url)
////            urlRequest.allHTTPHeaderFields = ["X-Api-Key" : "e69a263b-36bd-4d43-89d3-b77186c2138e"]
//
//            urlRequest.httpMethod = "GET"
//            URLSession.shared.dataTask(with: urlRequest) { (data, responce, error) in
//                if let jsonData = data {
//                    do {
//                        let decodeBreeds = try deoceder.decode([CatBreeds].self, from: jsonData)
//                        self.catBreeds = decodeBreeds
//                        DispatchQueue.main.async {
//
//                            debugPrint("try")
//
//
//                            for cats in self.catBreeds {
//                                debugPrint(cats.name)
//                            }
//
//                        }
//
//                    } catch {
//                        print(error)
//                    }
//                }
//            } .resume()
//        }
//
//    }
//}
