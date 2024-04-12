//
//  Body.swift
//  HW1
//
//  Created by Александр Федоткин on 12.04.2024.
//

import Foundation

enum Body : String, CaseIterable {
    case coupe = "Купе"
    case hatchback = "Хетчбек"
    case sedan = "Седан"
    case liftback = "Лифтбек"
    case jeep = "Джип"
    case stationWagon = "Универсал"
    case pickup = "Пикап"
    case minivan = "Минивэн"
    
    static subscript(index: String) -> Body? {
        switch index {
        case "1":
            return Body.coupe
        case "2":
            return Body.hatchback
        case "3":
            return Body.sedan
        case "4":
            return Body.liftback
        case "5":
            return Body.jeep
        case "6":
            return Body.stationWagon
        case "7":
            return Body.pickup
        case "8":
            return Body.minivan
        default:
            return nil
        }
    }
}
