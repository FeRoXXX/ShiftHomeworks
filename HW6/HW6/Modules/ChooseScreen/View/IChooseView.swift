//
//  IChooseView.swift
//  HW6
//
//  Created by Александр Федоткин on 27.05.2024.
//

import Foundation

protocol IChooseView: AnyObject {
    func toDetailViewController(viewController: DetailsViewController)
    func setupDataSource(dataSource: IChooseDataSource)
}
