//
//  DIshesDescriptionDataManager.swift
//  HW4
//
//  Created by Александр Федоткин on 08.05.2024.
//

import Foundation

class DishesDescriptionDataRepository: IDishesDescriptionDataRepository {
    private let model: DishDescriptionModel
    
    init(model: DishDescriptionModel) {
        self.model = model
    }
    
    func getData() -> DishDescriptionModel {
        model
    }
}
