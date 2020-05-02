//
//  CatsModel.swift
//  CatBreeds
//
//  Created by alexey sorochan on 29.04.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import Foundation
import UIKit

class Breed: Codable {
    let breeds: CatBreeds?
    let id: String?
    let url: String

    enum CodingKeys: String, CodingKey {
        case breeds, id, url
    }
}

class CatBreeds: Codable {

    let id: String?
    let name: String?
    let weight: CatWeight?
    let temperament: String?
    let origin: String?
    let countryCode: String?
    let lifeSpan: String?
    let description: String?
    var imageUrl: String?
    let altName: String?
    let wikiUrl: String?

    enum CodingKeys: String, CodingKey {
        case id, name, weight, temperament, origin, countryCode, description, imageUrl
        case lifeSpan = "life_span"
        case altName = "alt_names"
        case wikiUrl = "wikipedia_url"
    }
}

class CatWeight: Codable {
    let imperial: String?
    let metric: String?

    enum CodingKeys: String, CodingKey {
        case imperial, metric
    }
}

class CatUrlImage: Codable {
    let id: String?
    let url: String?
}
