//
//  DishDescriptionModel.swift
//  HW4
//
//  Created by Александр Федоткин on 06.05.2024.
//

import Foundation

struct DishDescriptionModel: Decodable {
    let dishName: String
    let dishImage: String
    let dishRecipe: String
}
