//
//  IDishesDataRepository.swift
//  HW5
//
//  Created by Александр Федоткин on 19.05.2024.
//

import Foundation

protocol IDishesDataRepository {
    func getData() -> [DishesModel]
}
