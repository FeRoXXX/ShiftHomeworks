//
//  Car.swift
//  HW1
//
//  Created by Александр Федоткин on 12.04.2024.
//

import Foundation

struct Car {
    var manufacturer: String
    var model: String
    var body: Body
    var yearsOfIssue: Int?
    var carNumber: String?
    
    func showCar() {
        print("• Производитель: ", self.manufacturer)
        print("• Модель: ", self.model)
        print("• Тип кузова: ", self.body.rawValue)
        if let yearsOfIssue = self.yearsOfIssue {
            print("• Год выпуска: \(yearsOfIssue) год")
        }
        if let carNumber = self.carNumber {
            print("• Гос номер: ", carNumber)
        }
        print("\n")
    }
}
