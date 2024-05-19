//
//  DishDetailRepository.swift
//  HW5
//
//  Created by Александр Федоткин on 19.05.2024.
//

import Foundation

class DishDetailRepository {
    private let dishesDataArray: [DishesModel]
    
    init(dishesDataArray: [DishesModel]) {
        self.dishesDataArray = dishesDataArray
    }
}

extension DishDetailRepository: IDishesDataRepository {
    func getData() -> [DishesModel] {
        dishesDataArray
    }
}
