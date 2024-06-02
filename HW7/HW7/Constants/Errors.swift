//
//  Errors.swift
//  HW7
//
//  Created by Александр Федоткин on 02.06.2024.
//

import Foundation

enum Errors: String {
    case errorInput = "Error in the entered data"
    case decodeError = "Decode error"
    case badURL = "Bad url"
}

enum RequestErrors: Error {
    case serverError
    case clientError
    case newDomain
    case emptyData
}

extension RequestErrors: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .serverError:
            return NSLocalizedString("Server error", comment: "")
        case .clientError:
            return NSLocalizedString("Client error", comment: "")
        case .newDomain:
            return NSLocalizedString("New domain", comment: "")
        case .emptyData:
            return NSLocalizedString("The dish was not found", comment: "")
        }
    }
}
