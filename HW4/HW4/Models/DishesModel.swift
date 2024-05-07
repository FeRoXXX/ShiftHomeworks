//
//  DishesModel.swift
//  HW4
//
//  Created by Александр Федоткин on 06.05.2024.
//

import Foundation

struct DishesModel: Decodable {
    let dishImage: String
    let dishName: String
    let cookingTime: String
    let cookingTimeImage: CookingTimeImage
    let dishDescription: DishDescriptionModel
    
    enum CookingTimeImage: String, Decodable {
        case easy = "easy"
        case medium = "medium"
        case hard = "hard"
    }
}
