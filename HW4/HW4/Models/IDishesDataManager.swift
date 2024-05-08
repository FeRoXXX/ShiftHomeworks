//
//  IDishesDataManager.swift
//  HW4
//
//  Created by Александр Федоткин on 06.05.2024.
//

import Foundation

protocol IDishesDataManager {
    func getCountOfData() -> Int
    func getDataFromIndex(from index: Int) -> DishesModel
    func getDescriptionManager(from index: Int) -> DishesDescriptionDataManager
}
