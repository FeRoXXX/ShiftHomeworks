//
//  DishReceiptViewModel.swift
//  HW5
//
//  Created by Александр Федоткин on 19.05.2024.
//

import Foundation

class DishReceiptViewModel {
    var data: DishDescriptionModel
    
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
    
    init(data: DishDescriptionModel) {
        self.data = data
        self.receiptData = DishReceiptModel(dishRecipe: data.dishRecipe)
        startTimer()
    }
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: Double.random(in: 0...15), repeats: true) { [weak self] _ in
            self?.updateData()
        }
    }
    
    private func updateData() {
        guard let element = Wishes.allCases.randomElement() else {
            receiptData = DishReceiptModel(dishRecipe: "Error")
            return
        }
        receiptData = DishReceiptModel(dishRecipe: element.rawValue)
    }
}
