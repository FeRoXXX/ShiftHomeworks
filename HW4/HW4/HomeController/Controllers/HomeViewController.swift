//
//  HomeViewController.swift
//  HW4
//
//  Created by Александр Федоткин on 06.05.2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var homeView = HomeView(delegate: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
}

private extension HomeViewController {
    func setupUI() {
        view = homeView
    }
}

extension HomeViewController: HomeCollectionViewDelegate {
    
}
