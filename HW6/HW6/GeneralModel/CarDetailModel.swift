//
//  CarDetailModel.swift
//  HW6
//
//  Created by Александр Федоткин on 27.05.2024.
//

import Foundation

struct CarDetailModel: Decodable {
    let id: String
    let imageName: String
    let carPrice: String
    let carType: CarType
}
