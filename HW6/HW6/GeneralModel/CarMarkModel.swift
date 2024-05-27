//
//  CarMarkModel.swift
//  HW6
//
//  Created by Александр Федоткин on 27.05.2024.
//

import Foundation

struct CarMarkModel: Decodable {
    let markName: String
    let carDetail: [CarDetailModel]
}

