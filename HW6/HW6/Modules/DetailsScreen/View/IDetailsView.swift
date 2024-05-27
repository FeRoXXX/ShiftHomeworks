//
//  IDetailsView.swift
//  HW6
//
//  Created by Александр Федоткин on 27.05.2024.
//

protocol IDetailsView: AnyObject {
    func updateTable(model: [CarTypeWithSelectModel])
    func updateCarPrice(model: String)
    func updateCarImage(model: String)
}
