//
//  DishesDataManager.swift
//  HW4
//
//  Created by Александр Федоткин on 06.05.2024.
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
    func getDescriptionData(from index: Int) -> DishDescriptionModel? {
        guard index < modelArray.count else {
            print(Errors.outOfBounds.rawValue)
            return nil
        }
        return modelArray[index].dishDescription
    }
    
    func getCountOfData() -> Int {
        modelArray.count
    }
    
    func getDataFromIndex(from index: Int) -> DishesModel? {
        guard index < modelArray.count else {
            print(Errors.outOfBounds.rawValue)
            return nil
        }
        return modelArray[index]
    }
}
