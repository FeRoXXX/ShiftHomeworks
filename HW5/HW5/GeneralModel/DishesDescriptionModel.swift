//
//  DishesDescriptionModel.swift
//  HW5
//
//  Created by Александр Федоткин on 19.05.2024.
//

import Foundation

struct DishDescriptionModel: Decodable {
    let dishName: String
    let dishImage: String
    let dishDescription: String
    let dishRecipe: String
}
