//
//  DeveloperSkills.swift
//  HW3
//
//  Created by Александр Федоткин on 26.04.2024.
//

import UIKit

class DeveloperSkillsViewController: UIViewController, IUsingDatas {
    var dataManager : IDataManager?
    
    private let generalInformationTextView : UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .clear
        textView.sizeToFit()
        textView.isScrollEnabled = false
        textView.isSelectable = false
        return textView
    }()
    
    private let otherLanguageButton : UIButton = {
        let button = UIButton()
        button.titleLabel?.numberOfLines = 0
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 10
        button.sizeToFit()
        return button
    }()
    
    private let learningResultAlert : UIAlertController = {
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

}

private extension DeveloperSkillsViewController {
    
    func configureUI() {
        view.backgroundColor = .darkGray
        view.addSubview(generalInformationTextView)
        NSLayoutConstraint.activate([
            generalInformationTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constraints.topConstrain),
            generalInformationTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            generalInformationTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constraints.leadingConstraint)
        ])
        
        view.addSubview(otherLanguageButton)
        NSLayoutConstraint.activate([
            otherLanguageButton.topAnchor.constraint(equalTo: generalInformationTextView.bottomAnchor, constant: Constraints.topConstrain),
            otherLanguageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            otherLanguageButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constraints.leadingConstraint),
            otherLanguageButton.heightAnchor.constraint(lessThanOrEqualToConstant: 150),
            otherLanguageButton.heightAnchor.constraint(greaterThanOrEqualToConstant: 100)
        ])
    }
    
    func provideData() {
        guard let dataManager = dataManager else {
            fatalError("Data is missing")
        }
        let data = dataManager.getDeveloperSkills()
        
        generalInformationTextView.attributedText = NSAttributedString(string: data.generalInformation, attributes: Fonts.system14)
        otherLanguageButton.setAttributedTitle(NSAttributedString(string: data.otherLanguage, attributes: Fonts.system14), for: .normal)
        learningResultAlert.message = data.learningResult

    }
    
    func setupButton() {
        otherLanguageButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
    }
    
    @objc func showAlert() {
        present(learningResultAlert, animated: true)
    }
}
