//
//  DishReceiptViewModelDelegate.swift
//  HW5
//
//  Created by Александр Федоткин on 19.05.2024.
//

import Foundation

protocol DishReceiptViewModelDelegate: AnyObject {
    func updateData(data: DishReceiptModel)
}
