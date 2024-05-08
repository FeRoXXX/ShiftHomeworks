//
//  ShowReceiptDelegate.swift
//  HW4
//
//  Created by Александр Федоткин on 07.05.2024.
//

import UIKit

protocol ShowReceiptDelegate: NSObject {
    var dataManager: IDishesDescriptionDataManager { get }
    func showReceiptViewController()
}
