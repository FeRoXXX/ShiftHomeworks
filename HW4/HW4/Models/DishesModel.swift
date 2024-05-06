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
    let cookingTimeImage: String
    let dishDescription: DishDescriptionModel
}
