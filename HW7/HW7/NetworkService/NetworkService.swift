//
//  NetworkService.swift
//  HW7
//
//  Created by Александр Федоткин on 02.06.2024.
//

import Foundation
import UIKit

enum NetworkService {
    case getURLRequest(parameters: [String: Any])
    case getImageRequest(url: String)
    
    private var sessionID: String {
        switch self {
        case .getURLRequest(_):
            return "1"
        case .getImageRequest(_):
            return "2"
        }
    }
    
    private var urlSession: URLSession {
        let configuration = URLSessionConfiguration.background(withIdentifier: sessionID)
        configuration.isDiscretionary = true
        configuration.sessionSendsLaunchEvents = true
        return URLSession(configuration: configuration, delegate: BackgroundSessionConfigurator.shared, delegateQueue: nil)
    }
}

extension NetworkService {
    
    private func makeRequest() -> URLRequest? {
        switch self {
        case .getURLRequest(let parameters):
            var baseComponent = URLComponents(string: "https://www.themealdb.com/api/json/v1/1/search.php")
            let queryParameters = parameters.map {
                URLQueryItem(name: $0.key, value: ($0.value as? String))
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
            completion(.failure(Errors.badURL.errorDescription))
            return
        }
        
        let task = urlSession.dataTask(with: request)
        task.taskDescription = UUID().uuidString
        BackgroundSessionConfigurator.shared.setCompletionHandler(for: task, handler: completion)
        task.resume()
    }
}
