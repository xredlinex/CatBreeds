//
//  CatBreedTableViewCell.swift
//  CatBreeds
//
//  Created by alexey sorochan on 30.04.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

class CatBreedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var catBreedImage: UIImageView!
    @IBOutlet weak var breedNameTextLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func updateCatBreedCell(breed: CatBreeds) {
        debugPrint(breed.description)
        breedNameTextLabel.text = breed.id ?? ""
        self.catBreedImage.downloadImage(url: breed.imageUrl ?? "" )
        
        
        
 
            
        }
        
        

    }



extension CatBreedTableViewCell {
    
    
    
     func getURL(breedId: String) -> (String) {
            
            var catUrl: String = "no urlz"
            
     
       
            
            var urlComponents = URLComponents(string: "https://api.thecatapi.com/v1/images/search")
            urlComponents?.queryItems = [URLQueryItem(name: "breed_id", value: breedId)]
            let url = urlComponents?.url
            
            if let urlCorrect = url {

                var urlRequest = URLRequest(url: urlCorrect)
                urlRequest.allHTTPHeaderFields = ["X-Api-Key" : "e69a263b-36bd-4d43-89d3-b77186c2138e"]
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

