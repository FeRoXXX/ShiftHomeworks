//
//  MealsResponseModel.swift
//  HW7
//
//  Created by Александр Федоткин on 02.06.2024.
//

import Foundation

struct MealsResponseModel: Decodable {
    let meals: [MealImageModel]
}
