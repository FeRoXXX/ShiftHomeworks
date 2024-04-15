//
//  Interface.swift
//  HW1
//
//  Created by Александр Федоткин on 12.04.2024.
//

import Foundation

enum Interface {
    enum MainInterface : String {
        case addCar = "1. Добавить новый автомобиль"
        case listOfCar = "2. Показать список автомобилей"
        case listWithFilter = "3. Использовать фильтр"
    }
    
    enum AddNewCar : String {
        case manufacturer = "* Введите производителя машины:"
        case model = "* Введите название модели:"
        case body = "* Выберите тип кузова:"
        case yearOfIssue = "Введите год выпуска:"
        case carNumber = "Введите гос номер:"
    }
}
