//
//  ListOfImageDataRepository.swift
//  HW7
//
//  Created by Александр Федоткин on 02.06.2024.
//

import Foundation

class ListOfImageDataRepository {
    func getData(text: String, completion: @escaping (Result<Data, Error>) -> Void) {
        let parameters: [String: Any] = ["s": text]
        NetworkService.getURLRequest(parameters: parameters).fetch(completion: { result in
            switch result {
            case .success(let success):
                do {
                    let mealData = try JSONDecoder().decode(MealsResponseModel.self, from: success)
                    mealData.meals.forEach {
                        let previewUrl = $0.strMealThumb + "/preview"
                        NetworkService.getImageRequest(url: previewUrl).fetch { result in
                            switch result {
                            case .success(let success):
                                completion(.success(success))
                            case .failure(let failure):
                                completion(.failure(failure))
                            }
                        }
                    }
                } catch {
                    completion(.failure(RequestErrors.emptyData))
                }
            case .failure(let failure):
                completion(.failure(failure))
            }
        })
    }
}
