//
//  ChooseTableViewDataSource.swift
//  HW6
//
//  Created by Александр Федоткин on 27.05.2024.
//

import UIKit

protocol IChooseDataSource: UITableViewDataSource {
    func set(model: [CarMarkModel])
}

final class ChooseTableViewDataSource: NSObject {
    private var carNameArray: [CarNameModel] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChooseTableViewCell.identifier, for: indexPath) as? ChooseTableViewCell else {
            return UITableViewCell()
        }
        guard carNameArray.count > indexPath.row else {
            print(Errors.outOfBounds.rawValue)
            return UITableViewCell()
        }
        
        cell.setupData(data: carNameArray[indexPath.row].carName)
        return cell
    }
    
}

extension ChooseTableViewDataSource: IChooseDataSource {
    func set(model: [CarMarkModel]) {
        carNameArray = model.map {
            CarNameModel(carName: $0.markName)
        }
    }
}
