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
    private let dataRepository: IDishesDataRepository
    private let index: Int
    
    init(dataRepository: IDishesDataRepository, index: Int) {
        self.dataRepository = dataRepository
        self.index = index
    }
}

extension DishDetailPresenter: IDishDetailPresenter {
    
    func toNextScreen() {
        ui?.showReceiptViewController(data: dataRepository.getData(), index: index)
    }
    
    func didLoad(view: IDishDetailView) {
        ui = view
        let tempData = dataRepository.getData()
        guard tempData.count > index else {
            fatalError(Errors.outOfBounds.rawValue)
        }
        let data = tempData[index].dishDescription
        descriptionData = DishDetailModel(dishName: data.dishName,
                                          dishImage: data.dishImage,
                                          dishDescription: data.dishDescription)
        guard let convertedData = descriptionData else {
            fatalError(Errors.dataIsMissing.rawValue)
        }
        ui?.set(model: convertedData)
    }
}
