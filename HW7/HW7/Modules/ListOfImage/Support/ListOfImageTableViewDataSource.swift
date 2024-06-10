//
//  ListOfImageTableViewDataSource.swift
//  HW7
//
//  Created by Александр Федоткин on 02.06.2024.
//

import UIKit

protocol IListOfImageDataSource: UITableViewDataSource {
    func setupData(model: ReceivedImageModel)
}

class ListOfImageDataSource: NSObject {
    
    private var data: [UIImage] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListOfImageTableViewCell.identifier, for: indexPath) as? ListOfImageTableViewCell else {
            return UITableViewCell()
        }
        cell.setupData(model: data[indexPath.row])
        return cell
    }
}

extension ListOfImageDataSource: IListOfImageDataSource {
    func setupData(model: ReceivedImageModel) {
        if let image = UIImage(data: model.encodedImage) {
            data.append(image)
        }
    }
}
