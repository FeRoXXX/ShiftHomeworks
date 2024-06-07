//
//  Errors.swift
//  HW7
//
//  Created by Александр Федоткин on 02.06.2024.
//

import Foundation

enum Errors: String {
    case errorInput
    case decodeError
    case badURL
}

extension Errors {
    public var errorDescription: NSError {
        switch self {
        case .badURL:
            return NSError(domain: "Bad url", code: 1)
        case .decodeError:
            return NSError(domain: "Decode error", code: 2)
        case .errorInput:
            return NSError(domain: "Error in the entered data", code: 3)
        }
    }
}

enum RequestErrors: Error {
    case serverError
    case clientError
    case newDomain
    case emptyData
}

extension RequestErrors {
    public var errorDescription: String? {
        switch self {
        case .serverError:
            return "Server error"
        case .clientError:
            return "Client error"
        case .newDomain:
            return "New domain"
        case .emptyData:
            return "The dish was not found"
        }
    }
}
