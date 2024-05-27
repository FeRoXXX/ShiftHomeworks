//
//  ChooseDataRepository.swift
//  HW6
//
//  Created by Александр Федоткин on 27.05.2024.
//

import Foundation

final class ChooseDataRepository {
    private var modelArray: [CarMarkModel] = []
    
    init() {
        guard let fileURL = Bundle.main.url(forResource: "Model", withExtension: "json") else {
            print(Errors.badURL.rawValue)
            return
        }
        do {
            let jsonData = try Data(contentsOf: fileURL)
            let dishesData: [CarMarkModel] = try JSONDecoder().decode([CarMarkModel].self, from: jsonData)
            self.modelArray = dishesData
        } catch {
            print("Error loading JSON file: \(error.localizedDescription)")
        }
    }
    
}

extension ChooseDataRepository: IChooseDataRepository {
    func getData() -> [CarMarkModel] {
        return modelArray
    }
}
