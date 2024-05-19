//
//  IDishDetailView.swift
//  HW5
//
//  Created by Александр Федоткин on 19.05.2024.
//

import Foundation

protocol IDishDetailView: AnyObject {
    func set(model: DishDetailModel)
    func showReceiptViewController(data: [DishesModel], index: Int)
}
