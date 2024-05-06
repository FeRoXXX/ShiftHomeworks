//
//  HomeCollectionViewCell.swift
//  HW4
//
//  Created by Александр Федоткин on 06.05.2024.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Cell doesn't exist")
    }
}

private extension HomeCollectionViewCell {
    func setupUI() {
        
    }
    
    func addSubviews() {
        
    }
    
    func setupLayout() {
        
    }
}

extension HomeCollectionViewCell {
    static var identifier: String{
        String(describing: HomeCollectionViewCell.self)
    }
}
