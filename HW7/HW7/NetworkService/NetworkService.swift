//
//  NetworkService.swift
//  HW7
//
//  Created by Александр Федоткин on 02.06.2024.
//

import Foundation

enum NetworkService {
    case getURLRequest(parameters: [String: Any])
    case getImageRequest(url: String)
    
    private var urlSession: URLSession {
        return URLSession.shared
    }
}

extension NetworkService {
    
    private func makeRequest() -> URLRequest? {
        switch self {
        case .getURLRequest(let parameters):
            var baseComponent = URLComponents(string: "https://www.themealdb.com/api/json/v1/1/search.php")
            let queryParameters = parameters.map {
                URLQueryItem(name: $0.key, value: ($0.value as! String))
            }
            
            baseComponent?.queryItems = queryParameters
            
            guard let baseComponentURL = baseComponent?.url else {
                return nil
            }

            return URLRequest(url: baseComponentURL)
        case .getImageRequest(let url):
            let baseComponent = URLComponents(string: url)
            
            guard let baseComponentURL = baseComponent?.url else {
                return nil
            }

            return URLRequest(url: baseComponentURL)
        }
    }
    
    func fetch(completion: @escaping (Result<Data, Error>) -> Void) {
        guard let request = makeRequest() else {
            fatalError() //TODO: make error
        }
        
        let task = urlSession.dataTask(with: request) { data, response, error in
            if let error {
                completion(.failure(error))
            } else if let httpResponse = response as? HTTPURLResponse,
                      let data {
                let statusCode = httpResponse.statusCode
                switch statusCode {
                case 200...299:
                    completion(.success(data))
                case 300...399:
                    fatalError()
                case 400...499:
                    fatalError()
                case 500...599:
                    fatalError()
                default:
                    break
                }
            }
        }
        task.resume()
    }
}

