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
        return URLSession(configuration: configuration, delegate: URLSessionDelegateImplement.shared, delegateQueue: nil)
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
            fatalError(Errors.badURL.rawValue)
        }
        
        let task = urlSession.dataTask(with: request)
        task.taskDescription = UUID().uuidString
        URLSessionDelegateImplement.shared.setCompletionHandler(for: task, handler: completion)
        task.resume()
    }
}

class URLSessionDelegateImplement: NSObject, URLSessionDelegate, URLSessionTaskDelegate, URLSessionDataDelegate {
    static let shared = URLSessionDelegateImplement()
    
    var completionHandlers: [String: (Result<Data, Error>) -> Void] = [:]
    var receivedData: [String: Data] = [:]

    func urlSession(_ session: URLSession, didBecomeInvalidWithError error: Error?) {}
    
    func urlSessionDidFinishEvents(forBackgroundURLSession session: URLSession) {
        DispatchQueue.main.async {
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate, let completionHandler = appDelegate.backgroundCompletion {
                appDelegate.backgroundCompletion = nil
                completionHandler()
            }
        }
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        let taskDescription = task.taskDescription ?? ""
        if let error = error {
            if let completionHandler = completionHandlers[taskDescription] {
                completionHandler(.failure(error))
                completionHandlers.removeValue(forKey: taskDescription)
            }
        } else if let data = receivedData[taskDescription] {
            if let completionHandler = completionHandlers[taskDescription] {
                completionHandler(.success(data))
                completionHandlers.removeValue(forKey: taskDescription)
                receivedData.removeValue(forKey: taskDescription)
            }
        }
        receivedData.removeValue(forKey: taskDescription)
    }
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        let taskDescription = dataTask.taskDescription ?? ""
        if receivedData[taskDescription] == nil {
            receivedData[taskDescription] = Data()
        }
        receivedData[taskDescription]?.append(data)
    }
    
    func setCompletionHandler(for task: URLSessionTask, handler: @escaping (Result<Data, Error>) -> Void) {
        completionHandlers[task.taskDescription ?? ""] = handler
    }
}

