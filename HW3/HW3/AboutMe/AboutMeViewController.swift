//
//  AboutMe.swift
//  HW3
//
//  Created by Александр Федоткин on 26.04.2024.
//

import UIKit

class AboutMeViewController: UIViewController, IUsingDatas {
    
    var dataManager: IDataManager?
    
    private let profileImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 100
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let firstAndLastNameTextField : UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.isEnabled = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let aboutCityLabel : UILabel = {
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

}

private extension AboutMeViewController {
    func configureUI() {
        view.backgroundColor = .darkGray
        view.addSubview(profileImageView)
        NSLayoutConstraint.activate([
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constraints.topConstrain),
            profileImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            profileImageView.heightAnchor.constraint(greaterThanOrEqualToConstant: 100),
            profileImageView.heightAnchor.constraint(lessThanOrEqualToConstant: 250)
        ])
        view.addSubview(firstAndLastNameTextField)
        NSLayoutConstraint.activate([
            firstAndLastNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstAndLastNameTextField.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: Constraints.topConstrain),
            firstAndLastNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constraints.leadingConstraint)
        ])
        view.addSubview(aboutCityLabel)
        NSLayoutConstraint.activate([
            aboutCityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            aboutCityLabel.topAnchor.constraint(equalTo: firstAndLastNameTextField.bottomAnchor, constant: Constraints.topConstrain),
            aboutCityLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constraints.leadingConstraint),
        ])
    }
    
    func provideData() {
        guard let dataManager = dataManager else {
            fatalError("Data is missing")
        }
        let data = dataManager.getAboutMeInfo()
        profileImageView.image = UIImage(named: data.profilePhoto)
        firstAndLastNameTextField.attributedText = NSAttributedString(string: data.firstAndLastName, attributes: Fonts.systemBold20)
        aboutCityLabel.attributedText = NSAttributedString(string: data.aboutCity, attributes: Fonts.system20)
    }
}
