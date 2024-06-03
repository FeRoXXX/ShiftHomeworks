//
//  DishesDataRepository.swift
//  HW5
//
//  Created by Александр Федоткин on 19.05.2024.
//

import Foundation

class DishesDataRepository {
    private var modelArray: [DishesModel] = []
    
    
    init() {
        guard let fileURL = Bundle.main.url(forResource: "Dishes", withExtension: "json") else {
            print(Errors.badURL.rawValue)
            return
        }
        do {
            let jsonData = try Data(contentsOf: fileURL)
            let dishesData: [DishesModel] = try JSONDecoder().decode([DishesModel].self, from: jsonData)
            self.modelArray = dishesData
        } catch {
            print("Error loading JSON file: \(error.localizedDescription)")
        }
    }
    
}

extension DishesDataRepository: IDishesDataRepository {
    func getData() -> [DishesModel] {
        return modelArray
    }
}
