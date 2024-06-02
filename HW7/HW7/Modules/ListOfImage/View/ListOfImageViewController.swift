//
//  ListOfImageViewController.swift
//  HW7
//
//  Created by Александр Федоткин on 02.06.2024.
//

import UIKit

class ListOfImageViewController: UIViewController {
    
    private lazy var componentView = ListOfImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupClousure()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ListOfImageViewController {
    
    func setupUI() {
        view = componentView
    }
    
    func setupClousure() {
        componentView.findImage = { [weak self] text in
            
        }
    }
}


