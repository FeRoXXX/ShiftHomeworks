//
//  ListOfImageDataRepository.swift
//  HW7
//
//  Created by Александр Федоткин on 02.06.2024.
//

import Foundation

class ListOfImageDataRepository {
    func getData(parameters: [String: Any], completion: @escaping (Result<Data, Error>) -> Void) {
        NetworkService.getURLRequest(parameters: parameters).fetch(completion: { result in
            switch result {
            case .success(let success):
                do {
                    let mealData = try JSONDecoder().decode(MealsResponseModel.self, from: success)
                    mealData.meals.forEach {
                        NetworkService.getImageRequest(url: $0.strMealThumb).fetch { result in
                            switch result {
                            case .success(let success):
                                completion(.success(success))
                            case .failure(let failure):
                                print(failure)
                            }
                        }
                    }
                } catch {
                    print("error")
                }
            case .failure(let failure):
                print(failure)
            }
        })
    }
}
