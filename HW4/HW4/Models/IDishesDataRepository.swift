//
//  IDishesDataManager.swift
//  HW4
//
//  Created by Александр Федоткин on 06.05.2024.
//

import Foundation

protocol IDishesDataRepository {
    func getCountOfData() -> Int
    func getDataFromIndex(from index: Int) -> DishesModel?
    func getDescriptionData(from index: Int) -> DishDescriptionModel?
}
