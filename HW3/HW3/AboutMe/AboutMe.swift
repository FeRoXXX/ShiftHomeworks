//
//  AboutMe.swift
//  HW3
//
//  Created by Александр Федоткин on 26.04.2024.
//

import UIKit

class AboutMe: UIViewController {
    
    var dataManager: DataManager!
    
    var profileImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 100
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var firstAndLastNameTextField : UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.isEnabled = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var aboutCityLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        provideData()
    }
    
    private func configureUI() {
        view.backgroundColor = .darkGray
        view.addSubview(profileImageView)
        NSLayoutConstraint.activate([
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            profileImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            profileImageView.heightAnchor.constraint(greaterThanOrEqualToConstant: 100),
            profileImageView.heightAnchor.constraint(lessThanOrEqualToConstant: 250)
        ])
        view.addSubview(firstAndLastNameTextField)
        NSLayoutConstraint.activate([
            firstAndLastNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstAndLastNameTextField.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 20),
            firstAndLastNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        view.addSubview(aboutCityLabel)
        NSLayoutConstraint.activate([
            aboutCityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            aboutCityLabel.topAnchor.constraint(equalTo: firstAndLastNameTextField.bottomAnchor, constant: 20),
            aboutCityLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ])
    }
    
    private func provideData() {
        guard let image = dataManager.getData(from: 0),
              let name = dataManager.getData(from: 1),
              let city = dataManager.getData(from: 2) else {
            fatalError("Data is missing")
        }
        profileImageView.image = UIImage(named: image.rawValue)
        firstAndLastNameTextField.attributedText = NSAttributedString(string: name.rawValue, attributes: [.font : UIFont.boldSystemFont(ofSize: 20), .foregroundColor : UIColor.white])
        aboutCityLabel.attributedText = NSAttributedString(string: city.rawValue, attributes: [.font : UIFont.systemFont(ofSize: 20), .foregroundColor : UIColor.white])
    }

}
