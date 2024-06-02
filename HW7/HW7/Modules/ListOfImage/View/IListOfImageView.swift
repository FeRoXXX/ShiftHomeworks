//
//  IListOfImageView.swift
//  HW7
//
//  Created by Александр Федоткин on 02.06.2024.
//

protocol IListOfImageView: AnyObject {
    func setupDataSource(dataSource: IListOfImageDataSource)
    func updateTable()
}
