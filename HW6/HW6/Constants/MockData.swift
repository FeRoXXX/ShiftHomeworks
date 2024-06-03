//
//  MockData.swift
//  HW6
//
//  Created by Александр Федоткин on 27.05.2024.
//

import Foundation

enum MockData {
    enum ChooseViewData: String {
        case select = "Выберите"
        case carMark = "Марку машины"
        case circle = "Circle"
        case selectForCell = "Select"
    }
    
    enum DetailsViewData: String {
        case chooseBodyType = "Выберите тип кузова"
        case price = "Цена"
        case calculatePrice = "Рассчитать цену"
    }
}
