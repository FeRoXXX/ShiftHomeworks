//
//  DishReceiptViewModel.swift
//  HW5
//
//  Created by Александр Федоткин on 19.05.2024.
//

import Foundation

class DishReceiptViewModel {
    var data: [DishesModel]
    var index: Int
    
    weak var delegate: DishReceiptViewModelDelegate? {
        didSet {
            delegate?.updateData(data: receiptData)
        }
    }
    
    private var receiptData: DishReceiptModel {
        didSet {
            delegate?.updateData(data: receiptData)
        }
    }
    
    init(data: [DishesModel], index: Int) {
        self.data = data
        self.index = index
        self.receiptData = DishReceiptModel(dishRecipe: data[index].dishDescription.dishRecipe)
        startTimer()
    }
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: Double.random(in: 0...10), repeats: true) { [weak self] _ in
            self?.updateData()
        }
    }
    
    private func updateData() {
        receiptData = DishReceiptModel(dishRecipe: data[index].dishDescription.dishRecipe)
    }
}
