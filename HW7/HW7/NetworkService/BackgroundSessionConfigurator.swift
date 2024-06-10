//
//  BackgroundSessionConfigurator.swift
//  HW7
//
//  Created by Александр Федоткин on 08.06.2024.
//

import UIKit

class BackgroundSessionConfigurator: NSObject {
    static let shared = BackgroundSessionConfigurator()
    
    var completionHandlers: [String: (Result<Data, Error>) -> Void] = [:]
    var receivedData: [String: Data] = [:]
    
    func setCompletionHandler(for task: URLSessionTask, handler: @escaping (Result<Data, Error>) -> Void) {
        guard let taskDescription = task.taskDescription else {
            return
        }
        completionHandlers[taskDescription] = handler
    }
}

extension BackgroundSessionConfigurator: URLSessionDelegate {
    
    func urlSession(_ session: URLSession, didBecomeInvalidWithError error: Error?) {}
    
    func urlSessionDidFinishEvents(forBackgroundURLSession session: URLSession) {
        DispatchQueue.main.async {
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate, let completionHandler = appDelegate.backgroundCompletion {
                appDelegate.backgroundCompletion = nil
                completionHandler()
            }
        }
    }
}

extension BackgroundSessionConfigurator: URLSessionTaskDelegate {
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        guard let taskDescription = task.taskDescription else {
            return
        }
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
}

extension BackgroundSessionConfigurator: URLSessionDataDelegate {
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        guard let taskDescription = dataTask.taskDescription else {
            return
        }
        
        if receivedData[taskDescription] == nil {
            receivedData[taskDescription] = Data()
        }
        receivedData[taskDescription]?.append(data)
    }
}
