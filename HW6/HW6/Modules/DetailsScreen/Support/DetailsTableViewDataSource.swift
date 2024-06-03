//
//  DetailsTableViewDataSource.swift
//  HW6
//
//  Created by Александр Федоткин on 27.05.2024.
//

import UIKit

protocol IDetailsTableViewDataSource: UITableViewDataSource {
    func setup(data: [CarTypeWithSelectModel])
}

final class DetailsTableViewDataSource: NSObject {
    private var carTypeData: [CarTypeWithSelectModel] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carTypeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BodyTypeTableViewCell.identifier, for: indexPath) as? BodyTypeTableViewCell else {
            return UITableViewCell()
        }
        if carTypeData[indexPath.row].isSelected {
            cell.setupData(model: carTypeData[indexPath.row].type.rawValue, imageName: "PointFill")
        } else {
            cell.setupData(model: carTypeData[indexPath.row].type.rawValue, imageName: "Point")
        }
        return cell
    }
}

extension DetailsTableViewDataSource: IDetailsTableViewDataSource {
    
    func setup(data: [CarTypeWithSelectModel]) {
        carTypeData = data
    }
}
