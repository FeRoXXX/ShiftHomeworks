//
//  DishesDataManager.swift
//  HW4
//
//  Created by Александр Федоткин on 06.05.2024.
//

import Foundation

class DishesDataManager {
    var model: [DishesModel] = []
    
    init() {
        guard let fileURL = Bundle.main.url(forResource: "Dishes", withExtension: "json") else {
            return
        }
        do {
            let jsonData = try Data(contentsOf: fileURL)
            let dishesData: [DishesModel] = try JSONDecoder().decode([DishesModel].self, from: jsonData)
            self.model = dishesData
        } catch {
            print("Error loading JSON file: \(error.localizedDescription)")
        }
    }
    
}

extension DishesDataManager: IDishesDataManager {
    func getCountOfData() -> Int {
        model.count
    }
    
    func getDataFromIndex(from index: Int) -> DishesModel {
        model[index]
    }
}
