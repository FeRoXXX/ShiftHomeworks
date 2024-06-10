//
//  IListOfImageView.swift
//  HW7
//
//  Created by Александр Федоткин on 02.06.2024.
//

protocol IListOfImageView: AnyObject {
    func setupDataSource(_ dataSource: IListOfImageDataSource)
    func updateTable()
    func showError(error: String)
}
