//
//  DeveloperSkills.swift
//  HW3
//
//  Created by Александр Федоткин on 26.04.2024.
//

import UIKit

class DeveloperSkills: UIViewController {
    var dataManager : DataManager!
    
    var generalInformationTextView : UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .clear
        textView.sizeToFit()
        textView.isScrollEnabled = false
        textView.isSelectable = false
        return textView
    }()
    
    var otherLanguageButton : UIButton = {
        let button = UIButton()
        button.titleLabel?.numberOfLines = 0
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 10
        button.sizeToFit()
        return button
    }()
    
    var learningResultAlert : UIAlertController = {
        let alert = UIAlertController()
        let okButton = UIAlertAction(title: "Ok", style: .cancel)
        alert.addAction(okButton)
        alert.title = "Что я жду от обучения"
        return alert
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        provideData()
        setupButton()
    }

    private func configureUI() {
        view.backgroundColor = .darkGray
        view.addSubview(generalInformationTextView)
        NSLayoutConstraint.activate([
            generalInformationTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            generalInformationTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            generalInformationTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        view.addSubview(otherLanguageButton)
        NSLayoutConstraint.activate([
            otherLanguageButton.topAnchor.constraint(equalTo: generalInformationTextView.bottomAnchor, constant: 20),
            otherLanguageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            otherLanguageButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            otherLanguageButton.heightAnchor.constraint(lessThanOrEqualToConstant: 150),
            otherLanguageButton.heightAnchor.constraint(greaterThanOrEqualToConstant: 100)
        ])
    }
    
    private func provideData() {
        guard let generalInformation = dataManager.getData(from: 3),
              let otherLanguage = dataManager.getData(from: 4),
              let learningResult = dataManager.getData(from: 5) else {
            fatalError("Data is missing")
        }
        
        generalInformationTextView.attributedText = NSAttributedString(string: generalInformation.rawValue, attributes: [.font : UIFont.systemFont(ofSize: 14), .foregroundColor : UIColor.white])
        otherLanguageButton.setAttributedTitle(NSAttributedString(string: otherLanguage.rawValue, attributes: [.font : UIFont.systemFont(ofSize: 14), .foregroundColor : UIColor.white]), for: .normal)
        learningResultAlert.message = learningResult.rawValue

    }
    
    private func setupButton() {
        otherLanguageButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
    }
    
    @objc func showAlert() {
        self.present(learningResultAlert, animated: true)
    }
}
