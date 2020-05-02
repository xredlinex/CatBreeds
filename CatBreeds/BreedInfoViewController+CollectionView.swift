//
//  BreedInfoViewController+CollectionView.swift
//  CatBreeds
//
//  Created by alexey sorochan on 02.05.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit


extension BreedInfoViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return catsCollection.count
      }
      
      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CatsCollectionViewCell", for: indexPath) as! CatsCollectionViewCell
        cell.updateImageCell(imageUrl: catsCollection[indexPath.row].url ?? "")
        return cell
      }

}