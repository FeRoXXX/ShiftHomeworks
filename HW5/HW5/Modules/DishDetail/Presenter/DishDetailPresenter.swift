//
//  DishDetailPresenter.swift
//  HW5
//
//  Created by Александр Федоткин on 19.05.2024.
//

import Foundation

final class DishDetailPresenter {
    private weak var ui: IDishDetailView?
    private var descriptionData: DishDetailModel?
    private let dishDescription: DishDescriptionModel
    
    init(dishDescription: DishDescriptionModel) {
        self.dishDescription = dishDescription
    }
}

extension DishDetailPresenter: IDishDetailPresenter {
    
    func toNextScreen() {
        ui?.showReceiptViewController(data: dishDescription)
    }
    
    func didLoad(view: IDishDetailView) {
        ui = view
        descriptionData = DishDetailModel(dishName: dishDescription.dishName,
                                          dishImage: dishDescription.dishImage,
                                          dishDescription: dishDescription.dishDescription)
        guard let convertedData = descriptionData else {
            fatalError(Errors.dataIsMissing.rawValue)
        }
        ui?.set(model: convertedData)
    }
}
