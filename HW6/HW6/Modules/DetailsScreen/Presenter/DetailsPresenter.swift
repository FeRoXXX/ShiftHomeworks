//
//  DetailsPresenter.swift
//  HW6
//
//  Created by Александр Федоткин on 27.05.2024.
//

import Foundation

final class DetailsPresenter {
    private weak var ui: IDetailsView?
    private var requestData: CarMarkModel
    private var carTypeDataArray: [CarTypeWithSelectModel] = []
    private var carTypeDetails: [CarTypeDetailsModel] = []
    
    init(requestData: CarMarkModel) {
        self.requestData = requestData
    }
}

extension DetailsPresenter: IDetailsPresenter {
    
    func loadView(ui: any IDetailsView) {
        self.ui = ui
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) { [weak self] in
            guard let self = self else {
                return
            }
            var currentID = ""
            requestData.carDetail.enumerated().forEach { (index, element) in
                self.carTypeDetails.append(CarTypeDetailsModel(id: element.id, imageName: element.imageName, carPrice: element.carPrice))
                if index == 0 {
                    self.carTypeDataArray.append(CarTypeWithSelectModel(id: element.id, type: element.carType, isSelected: true))
                    currentID = element.id
                } else {
                    self.carTypeDataArray.append(CarTypeWithSelectModel(id: element.id, type: element.carType, isSelected: false))
                }
            }
            
            ui.updateTable(model: carTypeDataArray)
            if let currentCarDetail = carTypeDetails.first(where: { $0.id == currentID }) {
                ui.updateCarImage(model: currentCarDetail.imageName)
                ui.updateCarPrice(model: currentCarDetail.carPrice)
            }
        }
    }
    
    func updateSelected(index: Int) {
        guard index >= 0 && index < carTypeDataArray.count else {
            print(Errors.outOfBounds.rawValue)
            return
        }
        var currentID = ""
        carTypeDataArray.enumerated().forEach { [weak self] (indexElement, _) in
            guard let self = self else {
                return
            }
            self.carTypeDataArray[indexElement].isSelected = (indexElement == index)
            if indexElement == index {
                currentID = self.carTypeDataArray[indexElement].id
            }
        }
        ui?.updateTable(model: carTypeDataArray)
        if let currentCarDetail = carTypeDetails.first(where: { $0.id == currentID }) {
            ui?.updateCarImage(model: currentCarDetail.imageName)
        }
    }
    
    func calculatePrice() {
        if let selectedCar = carTypeDataArray.first(where: { $0.isSelected }),
            let carDetail = carTypeDetails.first(where: { $0.id == selectedCar.id }) {
            ui?.updateCarPrice(model: carDetail.carPrice)
        }
    }
}
