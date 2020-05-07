//
//  AlertNotification.swift
//  CatBreeds
//
//  Created by alexey sorochan on 07.05.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import Foundation

class AlertErrors {
    
    enum ErrorText {
        case emptySearchField
        case moreTwoChar
        case noLink
        case noCatsFind
        case badRequest
        case noMoreCats
        case onlyLetters
    }
    
    func errorKey(_ error: ErrorText) -> String {
        
        switch error {
        case .emptySearchField:
            return "Cats Breeds Search Field is Empty"
        case .moreTwoChar:
            return "To Search Cat Breed Need More Than Two Characters!"
        case .noLink:
            return "Bad Request, No Link"
        case .noCatsFind:
            return "Sorry Cant Find Cats Breed!"
        case .badRequest:
            return "Bad Request"
        case .noMoreCats:
            return "All Cats Are Loaded"
        case .onlyLetters:
            return "Only letters!"
        }
    }
}
