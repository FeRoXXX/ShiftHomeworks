//
//  DataManagerDelegate.swift
//  HW4
//
//  Created by Александр Федоткин on 08.05.2024.
//

import Foundation

protocol DataManagerDelegate: NSObject {
    var dataManager: IDishesDescriptionDataManager { get }
}
