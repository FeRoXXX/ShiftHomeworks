//
//  IDetailsView.swift
//  HW6
//
//  Created by Александр Федоткин on 27.05.2024.
//

protocol IDetailsView: AnyObject {
    func updateTable()
    func updateCarPrice(model: String)
    func updateCarImage(model: String)
    func stopIndicator()
    func startIndicator()
    func setupDataSource(dataSource: IDetailsTableViewDataSource)
}
