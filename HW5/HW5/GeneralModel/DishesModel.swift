//
//  DishesModel.swift
//  HW5
//
//  Created by Александр Федоткин on 19.05.2024.
//

import Foundation

struct DishesModel: Decodable {
    let dishImage: String
    let dishName: String
    let cookingTime: String
    let cookingTimeImage: CookingTimeImage
    let dishDescription: DishDescriptionModel
}
